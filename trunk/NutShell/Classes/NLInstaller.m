/*******************************************************************************
 * NutShell Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

/* $Id: NLInstaller.m 252 2011-01-19 08:54:54Z macmade $ */

#import "NLInstaller.h"
#import "NLEventDispatcher.h"
#import "NLExecution.h"

@implementation NLInstaller

@synthesize packagePath;
@synthesize phase;
@synthesize status;
@synthesize progress;
@synthesize installing;
@synthesize installed;
@synthesize target;

+ ( id )installerWithPackage: ( NSString * )path
{
    id installer = [ [ self alloc ] initWithPackage: path ];
    
    return [ installer autorelease ];
}

- ( id )init
{
    if( ( self = [ super init ] ) )
    {
        execution = [ NLExecution getInstance ];
    }
    
    return self;
}

- ( id )initWithPackage: ( NSString * )path
{
    if( ( self = [ self init ] ) )
    {
        packagePath = [ path copy ];
    }
    
    return self;
}

- ( void )dealloc
{
    [ packagePath release ];
    [ phase release ];
    [ status release ];
    [ super dealloc ];
}

- ( void )parseInstallerLog: ( NSString * )str
{
    NSRange    range;
    NSString * logMessage;
    NSString * action;
    
    if( str != nil && [ str length ] > 11 && [ [ str substringToIndex: 10 ] isEqualToString: @"installer:" ] )
    {
        logMessage = [ str substringFromIndex: 10 ];
        
        if( [ [ logMessage substringToIndex: 1 ] isEqualToString: @"%" ] && [ logMessage length ] > 2 )
        {
            progress = [ [ logMessage substringFromIndex: 1 ] doubleValue ];
            
            [ self dispatchEvent: @"InstallerProgress" ];
            
            if( progress == 1 )
            {
                installed  = YES;
                installing = NO;
                
                [ self dispatchEvent: @"InstallerComplete" ];
            }
        }
        else
        {
            range = [ logMessage rangeOfString: @":" ];
            
            if( range.location != ( NSUInteger )NSIntegerMax )
            {
                action = [ logMessage substringToIndex: range.location ];
                
                if( [ action isEqualToString: @"STATUS" ] && installed == NO )
                {
                    [ status release ];
                    
                    status = [ [ logMessage substringFromIndex: range.location + 1 ] retain ];
                    
                    [ self dispatchEvent: @"InstallerStatus" ];
                    
                }
                else if( [ action isEqualToString: @"PHASE" ] )
                {
                    [ phase release ];
                    
                    phase = [ [ logMessage substringFromIndex: range.location + 1 ] retain ];
                    
                    if( installed == NO )
                    {
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
    
    if( fgets( buffer, sizeof( buffer ), io ) )
    {
        [ self parseInstallerLog: [ NSString stringWithCString: ( const char * )&buffer encoding: NSUTF8StringEncoding ] ];
    }
    else
    {
        [ timer invalidate ];
        fclose( io );
    }
}

- ( OSStatus )install
{
    if( [ target length ] > 0 )
    {
        return [ self installWithTarget: target ];
    }
    else
    {
        return [ self installWithTarget: @"/" ];
    }
}

- ( OSStatus )installWithTarget: ( NSString * )destTarget
{
    char * args[ 6 ];
    OSStatus execStatus;
    
    if( packagePath == nil )
    {
        NLFATAL( @"No package has been set" );
    }
    
    args[ 0 ] = "-verboseR";
    args[ 1 ] = "-pkg";
    args[ 2 ] = ( char * )[ packagePath cStringUsingEncoding: NSUTF8StringEncoding ];
    args[ 3 ] = "-target";
    
    if( destTarget != nil && [ destTarget length ] > 0 )
    {
        args[ 4 ] = ( char * )[ destTarget cStringUsingEncoding: NSUTF8StringEncoding ];
    }
    else
    {
        args[ 4 ] = "/";
    }
    
    args[ 5 ] = NULL;
    
    execStatus = [ execution executeWithPrivileges: "/usr/sbin/installer" arguments: args io: &io ];
    
    if( execStatus != 0 )
    {
        return execStatus;
    }
    
    installing = YES;
    installed  = NO;
    
    [ self dispatchEvent: @"InstallerStart" ];
    [ NSTimer scheduledTimerWithTimeInterval: 0.1 target: self selector: @selector( updateInstallerStatus: ) userInfo: nil repeats: YES ];
    
    return execStatus;
}

@end