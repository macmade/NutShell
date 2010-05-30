/*******************************************************************************
 * NutShell Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

#import "NLUIURLDownloader.h"
#import "NLEventDispatcher.h"
#import "NLEvent.h"

@interface NLUIURLDownloader( Private )

- ( void )updateDownloadProgress: ( NLEvent * )event;
- ( void )updateDownloadSpeed: ( NLEvent * )event;
- ( void )downloadComplete: ( NLEvent * )event;
- ( void )downloadError: ( NLEvent * )event;

@end

@implementation NLUIURLDownloader

@synthesize displayErrors;
@synthesize playSoundOnDownloadComplete;
@synthesize progressBar;
@synthesize statusText;
@synthesize speedText;
@synthesize timeRemainingText;
@synthesize byteSymbol;
@synthesize kiloByteSymbol;
@synthesize megaByteSymbol;
@synthesize gigaByteSymbol;
@synthesize percentSymbol;
@synthesize secondSymbol;
@synthesize secondsSymbol;
@synthesize minuteSymbol;
@synthesize minutesSymbol;
@synthesize hourSymbol;
@synthesize hoursSymbol;
@synthesize daySymbol;
@synthesize daysSymbol;
@synthesize statusFormat;
@synthesize speedFormat;
@synthesize timeRemainingFormat;
@synthesize timeRemainingNoDecimalFormat;
@synthesize errorFormat;
@synthesize errorTitle;
@synthesize errorOk;
@synthesize unknown;
@synthesize downloadButton;
@synthesize cancelButton;
@synthesize completeSound;

- ( id )init
{
    if( ( self = [ super init ] ) )
    {
        self.byteSymbol                   = @"B";
        self.kiloByteSymbol               = @"KB";
        self.megaByteSymbol               = @"MB";
        self.gigaByteSymbol               = @"GB";
        self.percentSymbol                = @"%";
        self.secondSymbol                 = @"second";
        self.secondsSymbol                = @"seconds";
        self.minuteSymbol                 = @"minute";
        self.minutesSymbol                = @"minutes";
        self.hourSymbol                   = @"hour";
        self.hoursSymbol                  = @"hours";
        self.daySymbol                    = @"day";
        self.daysSymbol                   = @"days";
        self.statusFormat                 = @"%.2f %@ of %.2f %@ - %.0f %@";
        self.speedFormat                  = @"%.2f %@ / %@";
        self.timeRemainingFormat          = @"%.2f %@";
        self.timeRemainingNoDecimalFormat = @"%.0f %@";
        self.errorFormat                  = @"A download error occured (reason: %@).";
        self.errorTitle                   = @"Download error";
        self.errorOk                      = @"OK";
        self.unknown                      = @"Unknown";
        self.playSoundOnDownloadComplete  = YES;
        self.displayErrors                = YES;
        
        [ self addEventListener: @"DataReceived" target: self selector: @selector( updateDownloadProgress: ) ];
        [ self addEventListener: @"DownloadSpeedUpdated" target: self selector: @selector( updateDownloadSpeed: ) ];
        [ self addEventListener: @"DownloadComplete" target: self selector: @selector( downloadComplete: ) ];
        [ self addEventListener: @"DownloadError" target: self selector: @selector( downloadError: ) ];
    }
    
    return self;
}

- ( void )dealloc
{
    [ byteSymbol release ];
    [ kiloByteSymbol release ];
    [ megaByteSymbol release ];
    [ gigaByteSymbol release ];
    [ percentSymbol release ];
    [ statusFormat release ];
    [ super dealloc ];
}

- ( void )downloadError: ( NLEvent * )event
{
    NSAlert  * alert;
    NSError  * error;
    NSString * errorText;
    
    [ downloadButton setEnabled:  YES ];
    [ cancelButton   setEnabled:  NO ];
    [ progressBar setDoubleValue: 0 ];
    [ progressBar setIndeterminate: NO ];
    [ statusText setStringValue: @"" ];
    [ speedText setStringValue: @"" ];
    [ timeRemainingText setStringValue: @"" ];
    
    if( displayErrors == YES )
    {
        error     = [ event target ];
        errorText =  [ NSString stringWithFormat: errorFormat, [ error localizedDescription ] ];
        alert     = [ NSAlert alertWithMessageText: errorTitle defaultButton: errorOk alternateButton: nil otherButton: nil informativeTextWithFormat: errorText ];
        
        [ alert setAlertStyle: NSCriticalAlertStyle ];
        [ alert runModal ];
    }
}

- ( void )downloadComplete: ( NLEvent * )event
{
    ( void )event;
    
    [ downloadButton setEnabled:  YES ];
    [ cancelButton   setEnabled:  NO ];
    [ progressBar setDoubleValue: 100 ];
    [ progressBar setIndeterminate: NO ];
    [ statusText setStringValue: @"" ];
    [ speedText setStringValue: @"" ];
    [ timeRemainingText setStringValue: @"" ];
    
    if( playSoundOnDownloadComplete )
    {
        [ completeSound play ];
    }
}

- ( void )updateDownloadProgress: ( NLEvent * )event
{
    double current;
    double total;
    NSString * currentUnit;
    NSString * totalUnit;
    
    ( void )event;
    
    if( bytesReceived > ( 1024 * 1024 * 1024 ) )
    {
        current     = ( double )( ( double )( bytesReceived / 1024 ) / 1024 ) / 1024;
        currentUnit = [ NSString stringWithString: gigaByteSymbol ];
    }
    else if( bytesReceived > ( 1024 * 1024 ) )
    {
        current     = ( double )( bytesReceived / 1024 ) / 1024;
        currentUnit = [ NSString stringWithString: megaByteSymbol ];
    }
    else if( bytesReceived > 1024 )
    {
        current     = ( double )( bytesReceived / 1024 );
        currentUnit = [ NSString stringWithString: kiloByteSymbol ];
    }
    else
    {
        current     = bytesReceived;
        currentUnit = [ NSString stringWithString: byteSymbol ];
    }
    
    if( bytesTotal > ( 1024 * 1024 * 1024 ) )
    {
        total     = ( double )( ( double )( bytesTotal / 1024 ) / 1024 ) / 1024;
        totalUnit = [ NSString stringWithString: gigaByteSymbol ];
    }
    else if( bytesTotal > ( 1024 * 1024 ) )
    {
        total     = ( double )( bytesTotal / 1024 ) / 1024;
        totalUnit = [ NSString stringWithString: megaByteSymbol ];
    }
    else if( bytesTotal > 1024 )
    {
        total     = ( double )( bytesTotal / 1024 );
        totalUnit = [ NSString stringWithString: kiloByteSymbol ];
    }
    else
    {
        total     = bytesTotal;
        totalUnit = [ NSString stringWithString: byteSymbol ];
    }
    
    if( bytesTotal != NSURLResponseUnknownLength )
    {
        [ progressBar stopAnimation: nil ];
        [ progressBar setIndeterminate: NO ];
        [ progressBar setDoubleValue: ( double )percentComplete ];
        [ statusText setStringValue: [ NSString stringWithFormat: statusFormat, current, currentUnit, total, totalUnit, percentComplete, percentSymbol ] ];
    }
    else
    {
        [ progressBar setIndeterminate: YES ];
        [ progressBar startAnimation: nil ];
        [ statusText setStringValue: unknown ];
    } 
}

- ( void )updateDownloadSpeed: ( NLEvent * )event
{
    double downloadSpeed;
    double remainingTime;
    NSString * downloadSpeedUnit;
    NSString * timeUnit;
    
    ( void )event;
    
    if( bytesPerSecond > ( 1024 * 1024 * 1024 ) )
    {
        downloadSpeed     = ( double )( ( double )( bytesPerSecond / 1024 ) / 1024 ) / 1024;
        downloadSpeedUnit = [ NSString stringWithString: gigaByteSymbol ];
    }
    else if( bytesPerSecond > ( 1024 * 1024 ) )
    {
        downloadSpeed     = ( double )( bytesPerSecond / 1024 ) / 1024;
        downloadSpeedUnit = [ NSString stringWithString: megaByteSymbol ];
    }
    else if( bytesPerSecond > 1024 )
    {
        downloadSpeed     = ( double )( bytesPerSecond / 1024 );
        downloadSpeedUnit = [ NSString stringWithString: kiloByteSymbol ];
    }
    else
    {
        downloadSpeed     = bytesPerSecond;
        downloadSpeedUnit = [ NSString stringWithString: byteSymbol ];
    }
    
    [ speedText setStringValue: [ NSString stringWithFormat: speedFormat, downloadSpeed, downloadSpeedUnit, secondSymbol ] ];
    
    remainingTime = ( bytesTotal - bytesReceived ) / bytesPerSecond;
    
    if( remainingTime > 86400 )
    {
        remainingTime = remainingTime / 86400;
        timeUnit      = ( remainingTime < 2 ) ? [ NSString stringWithString: daySymbol ] : [ NSString stringWithString: daysSymbol ];
    }
    else if( remainingTime > 3600 )
    {
        remainingTime = remainingTime / 3600;
        timeUnit      = ( remainingTime < 2 ) ? [ NSString stringWithString: hourSymbol ] : [ NSString stringWithString: hoursSymbol ];
    }
    else if ( remainingTime > 60 )
    {
        remainingTime = remainingTime / 60;
        timeUnit      = ( remainingTime < 2 ) ? [ NSString stringWithString: minuteSymbol ] : [ NSString stringWithString: minutesSymbol ];
    }
    else
    {
        timeUnit = ( remainingTime < 2 ) ? [ NSString stringWithString: secondSymbol ] : [ NSString stringWithString: secondsSymbol ];
        
        [ timeRemainingText setStringValue: [ NSString stringWithFormat: timeRemainingNoDecimalFormat, remainingTime, timeUnit ] ];
        
        return;
    }
    
    [ timeRemainingText setStringValue: [ NSString stringWithFormat: timeRemainingFormat, remainingTime, timeUnit ] ];
}

- ( BOOL )start
{
    BOOL hasStarted;
    
    [ progressBar setMinValue:      0 ];
    [ progressBar setMaxValue:      100 ];
    [ progressBar setDoubleValue:   0 ];
    [ progressBar setIndeterminate: NO ];
    
    hasStarted = [ super start ];
    
    if ( hasStarted == YES )
    {
        [ downloadButton setEnabled: NO ];
        [ cancelButton   setEnabled: YES ];
    }
    
    return hasStarted;
}

- ( void )cancel
{
    [ super cancel ];
    
    [ downloadButton setEnabled:        YES ];
    [ cancelButton   setEnabled:        NO ];
    [ progressBar setDoubleValue:       0 ];
    [ progressBar setIndeterminate:     YES ];
    [ statusText setStringValue:        @"" ];
    [ speedText setStringValue:         @"" ];
    [ timeRemainingText setStringValue: @"" ];
}

@end
