/*******************************************************************************
 * Cocos Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

#import "CSURLDownloader.h"
#import "CSEventDispatcher.h"

@implementation CSURLDownloader

@synthesize downloading;
@synthesize downloaded;
@synthesize allowOverwrite;
@synthesize bytesTotal;
@synthesize bytesReceived;
@synthesize bytesPerSecond;
@synthesize percentComplete;
@synthesize secondsRemaining;
@synthesize url;
@synthesize downloadDirectory;
@synthesize downloadLocation;

+ ( id )downloaderFromURL: ( NSURL * )urlObject
{
    id downloader = [ [ self alloc ] initWithURL: urlObject ];
    
    return [ downloader autorelease ];
}

+ ( id )downloaderFromString: ( NSString * )str
{
    id downloader = [ [ self alloc ] initWithString: str ];
    
    return [ downloader autorelease ];
}

- ( id )initWithURL: ( NSURL * )urlObject
{
    if( ( self = [ self init ] ) ) {
        
        url      = [ urlObject copy ];
        request  = [ [ NSURLRequest requestWithURL: url cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval: 60.0 ] retain ];
    }
    
    return self;
}

- ( id )initWithString: ( NSString * )str
{
    if( ( self = [ self init ] ) ) {
        
        url      = [ [ NSURL URLWithString: str ] retain ];
        request  = [ [ NSURLRequest requestWithURL: url cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval: 60.0 ] retain ];
    }
    
    return self;
}

- ( void )dealloc
{
    [ url release ];
    [ downloadDirectory release ];
    [ downloadLocation release ];
    [ download release ];
    [ request release ];
    [ response release ];
    [ super dealloc ];
}

- ( void )start
{
    if( downloading ) {
        
        return;
    }
    if( !downloadDirectory ) {
        
        downloadDirectory = [ [ [ NSString alloc ] initWithString: NSHomeDirectory() ] stringByAppendingPathComponent: @"Downloads" ];
    }
    
    download = [ [ NSURLDownload alloc ] initWithRequest: request delegate: self ];
    
    if( !download ) {
        
        CSFATAL( @"Impossible to create the NSURLDownload object" );
    }
    
    timer             = [ NSTimer scheduledTimerWithTimeInterval: 1 target: self selector: @selector( updateDownloadSpeed: ) userInfo: nil repeats: YES ];
    downloading       = YES;
    downloading       = NO;
    bytesReceived     = 0;
    lastBytesReceived = 0;
    
    [ self dispatchEvent: @"DownloadStarted" ];
}

- ( void )cancel
{
    if( downloading ) {
        
        [ download cancel ];
        [ timer invalidate ];
        
        [ self dispatchEvent: @"DownloadCancelled" ];
    }
}

- ( void )downloadDidFinish: ( NSURLDownload * )downloadObject 
{
    [ timer invalidate ];
    
    downloading = NO;
    downloaded  = YES;
    
    [ self dispatchEvent: @"DownloadComplete" ];
}

- ( void )download: ( NSURLDownload * )downloadObject didFailWithError: ( NSError * )error 
{
    [ timer invalidate ];
    
    downloading = NO;
    
    [ self dispatchEvent: @"DownloadError" target: error ];
}

- ( void )download: ( NSURLDownload * )downloadObject decideDestinationWithSuggestedFilename: ( NSString * )filename 
{
    [ downloadLocation release ];
    
    downloadLocation = [ [ downloadDirectory stringByAppendingPathComponent: filename ] retain ];
    
    [ downloadObject setDestination: downloadLocation allowOverwrite: allowOverwrite ];
}

- ( void )download: ( NSURLDownload * )downloadObject didCreateDestination: ( NSString * )path
{
    [ downloadLocation release ];
    
    downloadLocation = [ path copy ];
}

- ( void )download: ( NSURLDownload * )downloadObject didReceiveResponse: ( NSURLResponse * )responseObject
{
    [ responseObject retain];
    [ response release];
    
    bytesReceived = 0;
    response      = responseObject;
    bytesTotal    = [ responseObject expectedContentLength ];
    
    [ self dispatchEvent: @"ResponseReceived" ];
}

- ( void )download: ( NSURLDownload * )downloadObject didReceiveDataOfLength: ( unsigned int)length 
{
    bytesReceived += length;
    
    if( bytesTotal != NSURLResponseUnknownLength ) {
        
        percentComplete = ( bytesReceived / ( double )bytesTotal ) * 100.0;
    }
    
    [ self dispatchEvent: @"DataReceived" ];
}


- ( void )updateDownloadSpeed: ( NSTimer * )timerObject
{
    bytesPerSecond    = bytesReceived - lastBytesReceived;
    lastBytesReceived = bytesReceived;
    secondsRemaining  = ( bytesTotal - bytesReceived ) / bytesPerSecond;
    
    [ self dispatchEvent: @"DownloadSpeedUpdated" ];
}

@end
