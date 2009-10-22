/*******************************************************************************
 * Cocos Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

#import "CSDictionary.h"

@implementation NSDictionary( CSDictionary )

- ( BOOL )hasKey: ( NSString * )key
{
    return [ self objectForKey: key ] != nil;
}

@end
