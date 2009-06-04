/*******************************************************************************
 * Cocos Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

#import "CSReflectionProtocol.h"

@implementation CSReflectionProtocol

@synthesize name;

+ ( id )reflectorFromProtocol:( Protocol * )proto
{
    id reflector = [ [ self alloc ] initWithProtocol: proto ];
    
    return [ reflector autorelease ];
}

- ( NSString * )description
{
    NSString * description;
    
    description = [ [ super description ] stringByAppendingFormat: @"\n\t- protocol:\t%@", name ];
    
    return description;
}

- ( id )initWithProtocol:( Protocol * )proto
{
    if( proto && ( self = [ super init ] ) ) {
        
        name = NSStringFromProtocol( proto );
    }
    
    return self;
}

- ( void )dealloc
{
    [ super dealloc ];
}

@end
