/*******************************************************************************
 * CocoNuts Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

#import "CNReflectionProtocol.h"

@implementation CNReflectionProtocol

@synthesize name;

+ ( id )reflectorWithProtocol:( Protocol * )proto
{
    id reflector = [ [ self alloc ] initWithProtocol: proto ];
    
    return [ reflector autorelease ];
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
