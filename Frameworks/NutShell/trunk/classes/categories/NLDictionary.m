/*******************************************************************************
 * Cocos Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

#import "NLDictionary.h"

@implementation NSDictionary( NLDictionary )

/*!
 * @abstract    
 */
+ ( NSDictionary * )dictionaryByFilteringDictionary: ( NSDictionary * )source withCallback: ( BOOL ( ^ )( id ) )callback
{
    NSMutableDictionary * result;
    id                    key;
    id                    element;
    
    result = [ NSMutableDictionary dictionaryWithCapacity: [ source count ] ];
    
    for( key in source )
    {
        element = [ source objectForKey: source ];
        
        if( callback( element ) == YES )
        {
            [ result setObject: element forKey: key ];
        }
    }
    
    return [ NSDictionary dictionaryWithDictionary: result ];
}

- ( BOOL )hasKey: ( NSString * )key
{
    return [ self objectForKey: key ] != nil;
}

@end
