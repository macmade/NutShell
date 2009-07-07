/*******************************************************************************
 * Cocos Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

#import "CSUIInstaller.h"
#import "CSEventDispatcher.h"

@implementation CSUIInstaller

@synthesize phaseText;
@synthesize statusText;
@synthesize progressBar;
@synthesize indeterminateProgressForNewPhases;

- ( id )init
{
    if( ( self = [ super init ] ) ) {
        
        [ self addEventListener: @"InstallerProgress" target: self selector: @selector( updateProgressBar: ) ];
        [ self addEventListener: @"InstallerPhase" target: self selector: @selector( updatePhaseText: ) ];
        [ self addEventListener: @"InstallerStatus" target: self selector: @selector( updateStatusText: ) ];
        [ self addEventListener: @"InstallerComplete" target: self selector: @selector( installationComplete: ) ];
        
        indeterminateProgressForNewPhases = YES;
    }
    
    return self;
}

- ( void )updateProgressBar: ( CSEvent * )event
{
    [ progressBar setIndeterminate: NO ];
    [ progressBar stopAnimation: nil ];
    [ progressBar setDoubleValue: progress ];
}

- ( void )updatePhaseText: ( CSEvent * )event
{
    [ phaseText setStringValue: [ NSString stringWithString: phase ] ];
    
    if( indeterminateProgressForNewPhases == YES ) {
        
        [ progressBar setIndeterminate: YES ];
        [ progressBar startAnimation:   nil ];
    }
}

- ( void )updateStatusText: ( CSEvent * )event
{
    [ progressBar setIndeterminate: NO ];
    [ progressBar stopAnimation: nil ];
    [ statusText setStringValue: [ NSString stringWithString: status ] ];
}

- ( void )installationComplete: ( CSEvent * )event
{
    [ progressBar setIndeterminate: NO ];
    [ progressBar setDoubleValue:   1 ];
}

- ( OSStatus )installWithTarget: ( NSString * )target
{
    [ progressBar setMinValue:      0 ];
    [ progressBar setMaxValue:      1 ];
    [ progressBar setDoubleValue:   0 ];
    [ progressBar setIndeterminate: YES ];
    [ progressBar startAnimation:   nil ];
    
    return [ super installWithTarget: target ];
}

@end
