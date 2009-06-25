/*******************************************************************************
 * Cocos Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

#import "CSWindowFader.h"

@implementation CSWindowFader

@synthesize isFaded;
@synthesize closeAfterFade;
@synthesize fadeBy;
@synthesize fadeInterval;

+ ( id )faderWithWindow: ( NSWindow * )windowObject
{
    id fader = [ [ self alloc ] initWithWindow: windowObject ];
    
    return [ fader autorelease ];
}

- ( id )init
{
    if( ( self = [ super init ] ) ) {
        
        fadeBy       = ( float )0.2;
        fadeInterval = ( float )0.05;
    }
    
    return self;
}

- ( id )initWithWindow: ( NSWindow * )windowObject
{
    if( ( self = [ self init ] ) ) {
        
        window = windowObject;
        
        if( [ window alphaValue ] < 1 ) {
            
            isFaded = YES;
        }
    }
    
    return self;
}

- ( void )doFade: ( NSTimer * )timer
{
    NSNumber * alpha;
    
    alpha = ( NSNumber * )[ timer userInfo ];
    
    [ window setAlphaValue: [ window alphaValue ] - fadeBy ];
    
    if( [ window alphaValue ] <= [ alpha floatValue ] ) {
        
        [ timer invalidate ];
        
        isFading = NO;
        isFaded  = YES;
        
        if( closeAfterFade == YES ) {
            
            [ window close ];
            [ window setAlphaValue: 1 ];
        }
    }
}

- ( void )doUnFade: ( NSTimer * )timer
{
    NSNumber * alpha;
    
    alpha = ( NSNumber * )[ timer userInfo ];
    
    [ window setAlphaValue: [ window alphaValue ] + fadeBy ];
    
    if( [ window alphaValue ] >= [ alpha floatValue ] ) {
        
        [ timer invalidate ];
        
        isFading = NO;
        isFaded  = NO;
    }
}

- ( IBAction )fade: ( id )sender
{
    [ self fade ];
}

- ( IBAction )unFade: ( id )sender
{
    [ self unFade ];
}

- ( void )fade
{
    [ self fadeTo: 0 ];
}

- ( void )unFade
{
    [ self unFadeTo: 1 ];
}

- ( void )fadeTo: ( float )alphaValue
{
    NSTimer * timer;
    NSNumber * alpha;
    
    if( isFading == NO && isFaded == NO ) {
        
        isFading = YES;
        alpha    = [ NSNumber numberWithFloat: alphaValue ];
        timer    = [ NSTimer scheduledTimerWithTimeInterval: fadeInterval target: self selector: @selector( doFade: ) userInfo: alpha repeats: YES ];
    }
}


- ( void )unFadeTo: ( float )alphaValue
{
    NSTimer * timer;
    NSNumber * alpha;
    
    if( isFading == NO && isFaded == YES ) {
        
        isFading = YES;
        alpha    = [ NSNumber numberWithFloat: alphaValue ];
        timer    = [ NSTimer scheduledTimerWithTimeInterval: fadeInterval target: self selector: @selector( doUnFade: ) userInfo: alpha repeats: YES ];
    }
}

@end
