/*******************************************************************************
 * NutShell Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

#import "NLColor.h"

@implementation NSColor( NLColor )

+ ( NSColor * )finderSidebarColor
{
    return NLMakeColor( 214, 221, 229, 100, NLColorTypeRGB );
}

+ ( NSColor * )disabledFinderSidebarColor
{
    return NLMakeColor( 232, 232, 232, 100, NLColorTypeRGB );
}

@end
