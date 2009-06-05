/*******************************************************************************
 * Cocos Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

#import "CSScrollView.h"

@implementation NSScrollView( CSScrollView )

- ( void )scrollToBottom
{
    NSPoint newScrollOrigin;
    NSRect contentRect;
    NSRect documentRect;
    float scrollXPos;
    float xPos;
    
    contentRect  = [ [ self contentView ] bounds ];
    documentRect = [ [ self documentView ] bounds ];
    scrollXPos   = [ [ self horizontalScroller ] floatValue  ];
    xPos         = ( documentRect.size.width - contentRect.size.width ) * scrollXPos;
    
    if( [ [ self documentView ] isFlipped ] ) {
        
        newScrollOrigin = NSMakePoint( xPos, NSMaxY( documentRect ) - NSHeight( contentRect  ) );
        
    } else {
        
        newScrollOrigin = NSMakePoint( xPos, ( float )0.0 );
    }
    
    [ [ self documentView ] scrollPoint: newScrollOrigin ];
}

@end
