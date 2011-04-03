/*******************************************************************************
 * NutShell Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

/* $Id: NLColor.m 245 2010-05-30 14:18:05Z  $ */

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
