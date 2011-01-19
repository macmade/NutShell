/*******************************************************************************
 * NutShell Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

#import "NLView.h"
#import "NLColor.h"

@implementation NLView

@synthesize borderType;
@synthesize backgroundColor;
@synthesize backgroundImage;

- ( id )initWithFrame: ( NSRect )frameRect
{
    if( ( self = [ super initWithFrame: frameRect ] ) )
    {   
        self.borderType               = NSBezelBorder;
        self.backgroundColor          = [ NSColor finderSidebarColor ];
    }
    
    return self;
}

- ( void )dealloc
{
    [ backgroundColor release ];
    [ super dealloc ];
}

- ( void )setBackgroundColor: ( NSColor * )color
{
    [ backgroundColor release ];
    
    backgroundColor    = [ color copy ];
    hasBackgroundImage = NO;
}

- ( void )setBackgroundImage: ( NSImage * )image
{
    backgroundImage    = [ image copy ];
    hasBackgroundImage = YES;
}

- ( void )drawBorder
{
    NSPoint        p1;
    NSPoint        p2;
    NSPoint        p3;
    NSPoint        p4;
    NSRect         bounds;
    NSBezierPath * left;
    NSBezierPath * top;
    NSBezierPath * right;
    NSBezierPath * bottom;
    
    bounds = [ self bounds ];
    left   = [ [ NSBezierPath alloc ] init ];
    top    = [ [ NSBezierPath alloc ] init ];
    right  = [ [ NSBezierPath alloc ] init ];
    bottom = [ [ NSBezierPath alloc ] init ];
    
    p1 = NSMakePoint( bounds.origin.x, bounds.origin.y );
    p2 = NSMakePoint( bounds.origin.x, bounds.origin.y + bounds.size.height );
    p3 = NSMakePoint( bounds.origin.x + bounds.size.width, bounds.origin.y );
    p4 = NSMakePoint( bounds.origin.x, bounds.origin.y );
    
    [ left moveToPoint: p1 ];
    [ top moveToPoint: p2 ];
    [ right moveToPoint: p3 ];
    [ bottom moveToPoint: p4 ];
    
    p1.y += bounds.size.height;
    p2.x += bounds.size.width;
    p3.y += bounds.size.height;
    p4.x += bounds.size.width;
    
    [ left lineToPoint: p1 ];
    [ top lineToPoint: p2 ];
    [ right lineToPoint: p3 ];
    [ bottom lineToPoint: p4 ];
    
    [ left setLineWidth: 2 ];
    [ top setLineWidth: 2 ];
    [ right setLineWidth: 2 ];
    [ bottom setLineWidth: 2 ];
    
    switch( borderType )
    {
        case NSBezelBorder:
            
            [ [ NSColor colorWithCalibratedHue: 0 saturation: 0 brightness: ( CGFloat )0.45 alpha: 1 ] set ];
            [ top stroke ];
            
            [ [ NSColor colorWithCalibratedHue: 0 saturation: 0 brightness: ( CGFloat )0.60 alpha: 1 ] set ];
            [ left stroke ];
            [ right stroke ];
            [ bottom stroke ];
            
            break;
            
        default:
            
            [ [ NSColor blackColor ] set ];
            [ left stroke ];
            [ top stroke ];
            [ right stroke ];
            [ bottom stroke ];
            
            break;
    }
}

- ( void )drawBackground
{
    NSBezierPath * path = [ NSBezierPath bezierPathWithRect: [ self bounds ] ];
    
    [ [ NSGraphicsContext currentContext ] setPatternPhase: NSMakePoint( 0, [self frame].size.height ) ];
    [ backgroundColor set ];
    [ path fill ];
}

- ( void )drawBackgroundImage
{
    // Thanx to Matteo Bertozzi for the example
    NSRect         bounds;
    NSRect         frame;
    NSBezierPath * path;
    NSImage      * pattern;
    NSImage      * foreground;
    NSImage      * clip;
    
    bounds  = [ self bounds ];
    frame   = [ self frame ];
    path    = [ NSBezierPath bezierPathWithRect: bounds ];
    pattern = [ [ NSImage alloc ] initWithSize: bounds.size];
    
    [ pattern lockFocus ];
    
    [ [ NSGraphicsContext currentContext ] setPatternPhase: NSMakePoint( 0, frame.size.height ) ];
    [ [ NSColor colorWithPatternImage: backgroundImage ] set];
    
    NSRectFill( bounds );
    
    [ pattern unlockFocus];
    
    if( NSEqualSizes( [ pattern size ], [ path bounds ].size ) )
    {
        foreground = pattern;
    }
    else
    {
        foreground = [ [ [ NSImage alloc] initWithSize: bounds.size ] autorelease ];
        
        [ foreground lockFocus ];
        [ pattern compositeToPoint: NSMakePoint( [ pattern size ].width / 2, [ pattern size ].height / 2) operation: NSCompositeSourceOver ];
        [ foreground unlockFocus ];
    }
    
    clip = [ [ [ NSImage alloc] initWithSize: bounds.size ] autorelease ];
    
    [ clip lockFocus ];
    [ path fill ];
    [ foreground compositeToPoint: bounds.origin operation: NSCompositeSourceIn ];
    [ clip unlockFocus ];
    [ clip compositeToPoint: bounds.origin operation:NSCompositeSourceOver ];
}

- ( void )drawRect: ( NSRect )rect
{
    ( void )rect;
    
    [ [ NSGraphicsContext currentContext ] saveGraphicsState ];

    if( hasBackgroundImage )
    {
        [ self drawBackgroundImage ];
    }
    else
    {
        [ self drawBackground ];
    }

    if( borderType == NSLineBorder || borderType == NSBezelBorder )
    {
        [ self drawBorder ];
    }

    [ [ NSGraphicsContext currentContext] restoreGraphicsState ];
}

@end
