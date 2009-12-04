/*******************************************************************************
 * Cocos Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

#import "CSColor.h"

@implementation NSColor( CSColor )

+ ( NSColor * )finderSidebarColor
{
    return CSMakeColor( 214, 221, 229, 100, CSColorTypeRGB );
}

+ ( NSColor * )disabledFinderSidebarColor
{
    return CSMakeColor( 232, 232, 232, 100, CSColorTypeRGB );
}

@end
