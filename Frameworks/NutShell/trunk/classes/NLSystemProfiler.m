/*******************************************************************************
 * Cocos Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

#import "NLSystemProfiler.h"

@implementation NLSystemProfiler

- ( id )init
{
    if( ( self = [ super init ] ) && [ self isInited ] == NO )
    {}
    
    return self;
}

@end
