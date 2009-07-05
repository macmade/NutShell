/*******************************************************************************
 * Cocos Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

#import "CSInstaller.h"
#import "CSEventDispatcher.h"
#import "CSExecution.h"

@implementation CSInstaller

@synthesize packagePath;
@synthesize phaseText;
@synthesize statusText;
@synthesize progressBar;
@synthesize installing;
@synthesize installed;

+ ( id )installerWithPackage: ( NSString * )path
{
    id installer = [ [ CSInstaller alloc ] initWithPackage: path ];
    
    return [ installer autorelease ];
}

- ( id )init
{
    if( ( self = [ super init ] ) ) {
        
        execution = [ CSExecution getInstance ];
    }
    
    return self;
}

- ( id )initWithPackage: ( NSString * )path
{
    if( ( self = [ self init ] ) ) {
        
        packagePath = [ path copy ];
    }
    
    return self;
}

- ( void )dealloc
{
    [ packagePath release ];
    [ super dealloc ];
}

- ( void )parseInstallerLog: ( NSString * )str
{
    NSString * log;
    NSRange range;
    NSString * action;
    double percent;
    
    if( str != nil && [ str length ] > 11 && [ [ str substringToIndex: 10 ] isEqualToString: @"installer:" ] ) {
        
        log   = [ str substringFromIndex: 10 ];
        
        if( [ [ log substringToIndex: 1 ] isEqualToString: @"%" ] && [ log length ] > 2 ) {
            
            percent = [ [ log substringFromIndex: 1 ] doubleValue ];
            
            [ progressBar setDoubleValue: percent ];
            
            if( percent == 1 ) {
                
                installed  = YES;
                installing = NO;
                
                [ self dispatchEvent: @"InstallerComplete" ];
            }
            
        } else {
            
            range = [ log rangeOfString: @":" ];
            
            if( range.location != NSNotFound ) {
                
                action = [ log substringToIndex: range.location ];
                
                if( [ action isEqualToString: @"STATUS" ] ) {
                    
                    [ progressBar setIndeterminate: NO ];
                    [ statusText setStringValue: [ log substringFromIndex: range.location + 1 ] ];
                    
                    [ self dispatchEvent: @"InstallerStatus" ];
                    
                } else if( [ action isEqualToString: @"PHASE" ] ) {
                    
                    [ phaseText setStringValue: [ log substringFromIndex: range.location + 1 ] ];
                    
                    if( installed == NO ) {
                        
                        [ self dispatchEvent: @"InstallerPhase" ];
                    }
                }
            }
            
        }
    }
}

- ( void )updateInstallerStatus: ( NSTimer * )timer
{
    static int i;
    char buffer[ 128 ];
    i++;
    
    if( fgets( buffer, sizeof( buffer ), io ) ) {
        
        [ self parseInstallerLog: [ NSString stringWithCString: ( const char * )&buffer encoding: NSUTF8StringEncoding ] ];
        
    } else {
        
        [ progressBar setIndeterminate: NO ];
        [ timer invalidate ];
        fclose( io );
    }
}

- ( OSStatus )install
{
    return [ self installWithTarget: @"/" ];
}

- ( OSStatus )installWithTarget: ( NSString * )target
{
    char * args[ 6 ];
    OSStatus status;
    NSTimer * timer;
    
    if( packagePath == nil ) {
        
        CSFATAL( @"No package has been set" );
    }
    
    args[ 0 ] = "-verboseR";
    args[ 1 ] = "-pkg";
    args[ 2 ] = ( char * )[ packagePath cStringUsingEncoding: NSUTF8StringEncoding ];
    args[ 3 ] = "-target";
    
    if( target != nil && [ target length ] > 0 ) {
        
        args[ 4 ] = ( char * )[ target cStringUsingEncoding: NSUTF8StringEncoding ];
        
    } else {
        
        args[ 4 ] = "/";
    }
    
    args[ 5 ] = NULL;
    
    status = [ execution executeWithPrivileges: "/usr/sbin/installer" arguments: args io: &io ];
    
    if( status != 0 ) {
        
        return status;
    }
    
    installing = YES;
    installed  = NO;
    
    [ progressBar setMinValue: 0 ];
    [ progressBar setMaxValue: 1 ];
    [ progressBar setDoubleValue: 0 ];
    [ progressBar setIndeterminate: YES ];
    [ progressBar startAnimation: nil ];
    
    [ self dispatchEvent: @"InstallerStart" ];
    
    timer = [ NSTimer scheduledTimerWithTimeInterval: 0.1 target: self selector: @selector( updateInstallerStatus: ) userInfo: nil repeats: YES ];
    
    return status;
}

@end
