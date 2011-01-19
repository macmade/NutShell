/*******************************************************************************
 * NutShell Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

/* $Id: NLScrollView.m 248 2010-08-25 14:12:28Z  $ */

#import "NLScrollView.h"

@implementation NSScrollView( NLScrollView )

- ( void )scrollToBottom
{
    NSPoint newScrollOrigin;
    NSRect contentRect;
    NSRect documentRect;
    float scrollXPos;
    CGFloat xPos;
    
    contentRect  = [ ( NSView * )[ self contentView ] bounds ];
    documentRect = [ ( NSView * )[ self documentView ] bounds ];
    scrollXPos   = [ [ self horizontalScroller ] floatValue  ];
    xPos         = ( documentRect.size.width - contentRect.size.width ) * scrollXPos;
    
    if( [ [ self documentView ] isFlipped ] )
    {
        newScrollOrigin = NSMakePoint( xPos, NSMaxY( documentRect ) - NSHeight( contentRect  ) );
    }
    else
    {
        newScrollOrigin = NSMakePoint( xPos, ( float )0.0 );
    }
    
    [ [ self documentView ] scrollPoint: newScrollOrigin ];
}

@end
