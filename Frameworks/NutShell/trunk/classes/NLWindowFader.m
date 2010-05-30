/*******************************************************************************
 * Cocos Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

#import "NLWindowFader.h"

@implementation NLWindowFader

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
    if( ( self = [ super init ] ) )
    {
        fadeBy       = ( float )0.1;
        fadeInterval = ( float )0.025;
    }
    
    return self;
}

- ( id )initWithWindow: ( NSWindow * )windowObject
{
    if( ( self = [ self init ] ) )
    {
        window = windowObject;
        
        if( [ window alphaValue ] < 1 )
        {
            isFaded = YES;
        }
    }
    
    return self;
}

- ( void )doFade: ( NSTimer * )timerObject
{
    NSNumber * alpha;
    
    alpha = ( NSNumber * )[ timerObject userInfo ];
    
    [ window setAlphaValue: [ window alphaValue ] - fadeBy ];
    
    if( [ window alphaValue ] <= [ alpha floatValue ] )
    {
        [ timerObject invalidate ];
        
        isFading = NO;
        isFaded  = YES;
        
        if( closeAfterFade == YES )
        {
            [ window close ];
            [ window setAlphaValue: 1 ];
        }
    }
}

- ( void )doUnFade: ( NSTimer * )timerObject
{
    NSNumber * alpha;
    
    alpha = ( NSNumber * )[ timerObject userInfo ];
    
    [ window setAlphaValue: [ window alphaValue ] + fadeBy ];
    
    if( [ window alphaValue ] >= [ alpha floatValue ] )
    {
        [ timerObject invalidate ];
        
        isFading = NO;
        isFaded  = NO;
    }
}

- ( IBAction )fade: ( id )sender
{
    ( void )sender;
    
    [ self fade ];
}

- ( IBAction )unFade: ( id )sender
{
    ( void )sender;
    
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
    NSNumber * alpha;
    
    if( [ timer isValid ] )
    {
        [ timer invalidate ];
        isFaded  = NO;
        isFading = NO;
    }
    
    if( isFading == NO && isFaded == NO )
    {
        isFading = YES;
        alpha    = [ NSNumber numberWithFloat: alphaValue ];
        timer    = [ NSTimer scheduledTimerWithTimeInterval: fadeInterval target: self selector: @selector( doFade: ) userInfo: alpha repeats: YES ];
    }
}


- ( void )unFadeTo: ( float )alphaValue
{
    NSNumber * alpha;
    
    if( [ timer isValid ] )
    {
        [ timer invalidate ];
        isFaded  = YES;
        isFading = NO;
    }
    
    if( isFading == NO && isFaded == YES )
    {
        isFading = YES;
        alpha    = [ NSNumber numberWithFloat: alphaValue ];
        timer    = [ NSTimer scheduledTimerWithTimeInterval: fadeInterval target: self selector: @selector( doUnFade: ) userInfo: alpha repeats: YES ];
    }
}

@end
