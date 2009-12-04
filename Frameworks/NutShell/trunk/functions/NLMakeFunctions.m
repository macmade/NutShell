/*******************************************************************************
 * Cocos Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

#import "NLMakeFunctions.h"

NSColor * NLMakeColor( NSUInteger v1, NSUInteger v2, NSUInteger v3, NSUInteger alpha, NLColorType type )
{
    switch( type ) {
        
        case NLColorTypeHSB:
            
            return [ NSColor colorWithCalibratedHue: ( CGFloat )v1 / 360 saturation: ( CGFloat )v2 / 100 brightness: ( CGFloat )v3 / 100 alpha: ( CGFloat )alpha / 100 ];
            
        default:
            
            return [ NSColor colorWithCalibratedRed: ( CGFloat )v1 / 255 green: ( CGFloat )v2 / 255 blue: ( CGFloat )v3 / 255 alpha: ( CGFloat )alpha / 100 ];
    }
}
