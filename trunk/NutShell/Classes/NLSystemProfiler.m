/*******************************************************************************
 * NutShell Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

/* $Id: NLSystemProfiler.m 245 2010-05-30 14:18:05Z  $ */

#import "NLSystemProfiler.h"

@implementation NLSystemProfiler

- ( id )init
{
    if( ( self = [ super init ] ) && [ self isInited ] == NO )
    {}
    
    return self;
}

@end
