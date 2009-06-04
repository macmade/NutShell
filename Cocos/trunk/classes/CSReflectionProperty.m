/*******************************************************************************
 * Cocos Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

#import <objc/runtime.h>
#import "CSReflectionProperty.h"

@implementation CSReflectionProperty

@synthesize property;
@synthesize name;
@synthesize attributes;

+ ( id )reflectorWithProperty:( objc_property_t )prop
{
    id reflector = [ [ self alloc ] initWithProperty: prop ];
    
    return [ reflector autorelease ];
}

- ( id )initWithProperty:( objc_property_t )prop
{
    if( ( self = [ self init ] ) ) {
        
        property   = prop;
        name       = [ [ NSString alloc ] initWithCString: property_getName( prop ) encoding: NSUTF8StringEncoding ];
        attributes = [ [ NSString alloc ] initWithCString: property_getAttributes( prop ) encoding: NSUTF8StringEncoding ];
    }
    
    return self;
}

- ( void )dealloc
{
    [ name release ];
    [ attributes release ];
    [ super dealloc ];
}

@end
