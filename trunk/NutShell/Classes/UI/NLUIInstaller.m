/*******************************************************************************
 * NutShell Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

/* $Id: NLUIInstaller.m 245 2010-05-30 14:18:05Z  $ */

#import "NLUIInstaller.h"
#import "NLEventDispatcher.h"

@interface NLUIInstaller( Private )

- ( void )updateProgressBar: ( NLEvent * )event;
- ( void )updatePhaseText: ( NLEvent * )event;
- ( void )updateStatusText: ( NLEvent * )event;
- ( void )installationComplete: ( NLEvent * )event;

@end

@implementation NLUIInstaller

@synthesize phaseText;
@synthesize statusText;
@synthesize progressBar;
@synthesize indeterminateProgressForNewPhases;
@synthesize playSoundOnInstallComplete;
@synthesize completeSound;
@synthesize installButton;
@synthesize quitButton;

- ( id )init
{
    if( ( self = [ super init ] ) )
    {
        [ self addEventListener: @"InstallerProgress" target: self selector: @selector( updateProgressBar: ) ];
        [ self addEventListener: @"InstallerPhase"    target: self selector: @selector( updatePhaseText: ) ];
        [ self addEventListener: @"InstallerStatus"   target: self selector: @selector( updateStatusText: ) ];
        [ self addEventListener: @"InstallerComplete" target: self selector: @selector( installationComplete: ) ];
        
        indeterminateProgressForNewPhases = YES;
        playSoundOnInstallComplete        = YES;
    }
    
    return self;
}

- ( void )updateProgressBar: ( NLEvent * )event
{
    ( void )event;
    
    [ progressBar setIndeterminate: NO ];
    [ progressBar stopAnimation:    nil ];
    [ progressBar setDoubleValue: progress ];
}

- ( void )updatePhaseText: ( NLEvent * )event
{
    ( void )event;
    
    [ phaseText setStringValue: [ NSString stringWithString: phase ] ];
    
    if( indeterminateProgressForNewPhases == YES )
    {
        [ progressBar setIndeterminate: NO ];
        [ progressBar startAnimation:   nil ];
    }
}

- ( void )updateStatusText: ( NLEvent * )event
{
    ( void )event;
    
    [ progressBar setIndeterminate: NO ];
    [ progressBar stopAnimation: nil ];
    [ statusText setStringValue: [ NSString stringWithString: status ] ];
}

- ( void )installationComplete: ( NLEvent * )event
{
    ( void )event;
    
    [ progressBar setIndeterminate: NO ];
    [ progressBar setDoubleValue:   100 ];
    
    [ installButton setEnabled: NO ];
    [ quitButton    setEnabled: YES ];
    
    if( playSoundOnInstallComplete == YES )
    {
        [ completeSound play ];
    }
}

- ( OSStatus )installWithTarget: ( NSString * )destTarget
{
    [ progressBar setMinValue:      0 ];
    [ progressBar setMaxValue:      100 ];
    [ progressBar setDoubleValue:   0 ];
    [ progressBar setIndeterminate: YES ];
    [ progressBar startAnimation:   nil ];
    
    return [ super installWithTarget: destTarget ];
}

- ( OSStatus )install
{
    return [ self install: nil ];
}

- ( OSStatus )install: ( id )sender
{
    OSStatus execStatus;
    
    ( void )sender;
    
    execStatus = [ super install ];
    
    if( execStatus == 0 )
    {
        [ installButton setEnabled: NO ];
        [ quitButton    setEnabled: NO ];
    }
    else
    {
        [ installButton setEnabled: YES ];
        [ quitButton    setEnabled: YES ];
    }
    
    return execStatus;
}

@end
