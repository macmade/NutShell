/*******************************************************************************
 * Copyright (c) 2011, Jean-David Gadina - www.xs-labs.com
 * Distributed under the Boost Software License, Version 1.0.
 * 
 * Boost Software License - Version 1.0 - August 17th, 2003
 * 
 * Permission is hereby granted, free of charge, to any person or organization
 * obtaining a copy of the software and accompanying documentation covered by
 * this license (the "Software") to use, reproduce, display, distribute,
 * execute, and transmit the Software, and to prepare derivative works of the
 * Software, and to permit third-parties to whom the Software is furnished to
 * do so, all subject to the following:
 * 
 * The copyright notices in the Software and this entire statement, including
 * the above license grant, this restriction and the following disclaimer,
 * must be included in all copies of the Software, in whole or in part, and
 * all derivative works of the Software, unless such copies or derivative
 * works are solely in the form of machine-executable object code generated by
 * a source language processor.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
 * SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
 * FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
 * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 ******************************************************************************/

/* $Id: NLUISegmentedTabView.m 248 2010-08-25 14:12:28Z  $ */

#import "NLUISegmentedTabView.h"
#import "NLEventDispatcher.h"

@implementation NLUISegmentedTabView

@synthesize control;
@synthesize view;

- ( id )initWithFrame: ( NSRect )frame
{
    NSRect rect;
    
    if( ( self = [ super initWithFrame: frame ] ) )
    {
        views   = [ [ NSMutableArray arrayWithCapacity: 5 ] retain ];
        titles  = [ [ NSMutableArray arrayWithCapacity: 5 ] retain ];
        control = [ [ NSSegmentedControl alloc ] init ];
        
        [ control setSegmentStyle: NSSegmentStyleTexturedRounded ];
        [ control setFocusRingType: NSFocusRingTypeNone ];
        [ control setSegmentCount: 0 ];
        [ control setTarget: self ];
        [ control setAction: @selector( selectItem: ) ];
        [ control sizeToFit ];
        [ self addSubview: control ];
        
        rect.origin.x    = 18;
        rect.origin.y    = frame.size.height - [ control frame ].size.height;
        rect.size.width  = frame.size.width - 36;
        rect.size.height = [ control frame ].size.height;
        
        [ control setFrame: rect ];
    }
    
    return self;
}

- ( void )dealloc
{
    [ control release ];
    [ views release ];
    [ titles release ];
    [ super dealloc ];
}

- ( void )setControlStyle: ( NSSegmentStyle )style
{
    [ control setSegmentStyle: style ];
}

- ( void )updateWidthOfSegments
{
    NSUInteger count;
    NSUInteger i;
    CGFloat margin;
    
    count = [ control segmentCount ];
    
    for( i = 0; i < count; i++ )
    {
        [ control setWidth: ( ( [ self frame ].size.width - 36 ) / count ) forSegment: i ];
    }
    
    [ control sizeToFit ];
    
    margin = [ control frame ].size.width - ( [ self frame ].size.width - 36 );
    
    for( i = 0; i < count; i++ )
    {
        [ control setWidth: ( ( [ self frame ].size.width - 36 ) / count ) - ( margin / count ) forSegment: i ];
    }
}

- ( void )addView: ( NSView * )viewObject title: ( NSString * )title
{
    NSRect rect;
    
    [ views addObject: viewObject ];
    [ titles addObject: title ];
    [ control setSegmentCount: [ control segmentCount ] + 1 ];
    [ control setLabel: title forSegment: [ control segmentCount ] - 1 ];
    
    rect.origin.x    = 0;
    rect.origin.y    = 0;
    rect.size.width  = [ viewObject frame ].size.width;
    rect.size.height = [ viewObject frame ].size.height;
    
    [ viewObject setFrame: rect ];
    
    if( [ views count ] - 1 == indexOfSelectedView )
    {
        [ self selectView: indexOfSelectedView ];
    }
    
    [ self updateWidthOfSegments ];
}

- ( void )removeView: ( NSUInteger )viewIndex
{
    int i;
    
    if( viewIndex == indexOfSelectedView )
    {
        [ self.selectedView removeFromSuperview ];
    }
    
    [ views removeObjectAtIndex: viewIndex ];
    [ titles removeObjectAtIndex: viewIndex ];
    
    [ control setSegmentCount: [ control segmentCount ] -1 ];
    
    for( i = 0; i < [ control segmentCount ]; i++ )
    {
        [ control setLabel: [ titles objectAtIndex: i ] forSegment: i ];
    }
    
    [ self updateWidthOfSegments ];
}

- ( void )selectItem: ( id )sender
{
    [ self selectView: [ sender selectedSegment ] ];
}

- ( void )selectView: ( NSUInteger )viewIndex
{
    NSUserDefaults * defaults;
    NSRect r1;
    NSRect r2;
    NSRect r3;
    NSRect r4;
    
    if( viewIndex < [ views count ] )
    {
        [ self.selectedView removeFromSuperview ];
        
        indexOfSelectedView = viewIndex;
        
        [ control setSelectedSegment: indexOfSelectedView ];
        
        r1 = [ [ self window ] frame ];
        r2 = [ self frame ];
        r3 = [ ( NSView * )[ views objectAtIndex: indexOfSelectedView ] frame ];
        r4 = [ control frame ];
        
        if( r3.size.width < r2.size.width )
        {
            r1.size.width -= r2.size.width - r3.size.width;
            r2.size.width -= r2.size.width - r3.size.width;
        }
        else
        {
            r1.size.width += r3.size.width - r2.size.width;
            r2.size.width += r3.size.width - r2.size.width;
        }
        
        if( r3.size.height < r2.size.height )
        {
            r1.size.height -= ( r2.size.height - r3.size.height ) - r4.size.height;
            r1.origin.y    += ( r2.size.height - r3.size.height ) - r4.size.height;
            r2.size.height -= ( r2.size.height - r3.size.height ) - r4.size.height;
        }
        else
        {
            r1.size.height += ( r3.size.height - r2.size.height ) + r4.size.height;
            r1.origin.y    -= ( r3.size.height - r2.size.height ) + r4.size.height;
            r2.size.height += ( r3.size.height - r2.size.height ) + r4.size.height;
        }
        
        r4.origin.y    = r2.size.height - r4.size.height;
        
        [ control setFrame: r4 ];
        
        [ control setHidden: YES ];
        [ [ self window ] setFrame: r1 display: YES animate: YES ];
        [ control setHidden: NO ];
        [ self setFrame: r2 ];
        
        [ self updateWidthOfSegments ];
        [ self addSubview: [ views objectAtIndex: indexOfSelectedView ] ];
        
        [ ( NSView * )[ views objectAtIndex: indexOfSelectedView ] setFrame: r3 ];
        
        if( autoSaveName )
        {
            defaults = [ NSUserDefaults standardUserDefaults ];
            
            [ defaults setInteger: indexOfSelectedView forKey: autoSaveName ];
        }
        
        [ self dispatchEvent: @"TabSelected" ];
        
    }
    else
    {
        NLFATAL( @"Trying to select view %li which does not exist", ( unsigned long )index );
    }
}

- ( NSArray * )views
{
    return [ NSArray arrayWithArray: views ];
}

- ( NSArray * )titles
{
    return [ NSArray arrayWithArray: titles ];
}

- ( NSString * )autoSaveName
{
    if( autoSaveName )
    {
        return [ NSString stringWithString: autoSaveName ];
    }
    
    return nil;
}

- ( void )setAutoSaveName: ( NSString * )name
{
    NSUserDefaults * defaults;
    
    [ autoSaveName release ];
    
    defaults     = [ NSUserDefaults standardUserDefaults ];
    autoSaveName = [ name copy ];
    
    [ self selectView: [ defaults integerForKey: autoSaveName ] ];
}

- ( NSUInteger )indexOfSelectedView
{
    return indexOfSelectedView;
}

- ( void )setIndexOfSelectedView: ( NSUInteger )viewIndex
{
    [ self selectView: viewIndex ];
}

- ( NSView * )selectedView
{
    return [ views objectAtIndex: indexOfSelectedView ];
}

- ( NSString * )titleOfSelectedView
{
    return [ titles objectAtIndex: indexOfSelectedView ];
}

@end
