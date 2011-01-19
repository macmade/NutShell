/*******************************************************************************
 * NutShell Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

/* $Id: NLColor.m 728 2009-08-15 13:35:58Z  $ */

#import "NLArray.h"

@implementation NSArray( NLArray )

+ ( NSArray * )arrayByFilteringArray: ( NSArray * )source withCallback: ( BOOL ( ^ )( id ) )callback
{
    NSMutableArray * result;
    id               element;
    
    result = [ NSMutableArray arrayWithCapacity: [ source count ] ];
    
    for( element in source )
    {
        if( callback( element ) == YES )
        {
            [ result addObject: element ];
        }
    }
    
    return [ NSArray arrayWithArray: result ];
}

@end
