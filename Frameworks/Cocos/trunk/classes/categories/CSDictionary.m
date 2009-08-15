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
    NSArray * keys;
    NSString * curKey;
    
    keys = [ self allKeys ];
    
    for( curKey in keys ) {
        
        if( [ key isEqualToString: curKey ] == YES ) {
            
            return YES;
        }
    }
    
    return NO;
}

@end
