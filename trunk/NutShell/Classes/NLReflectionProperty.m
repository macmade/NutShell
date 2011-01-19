/*******************************************************************************
 * NutShell Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

/* $Id: NLReflectionProperty.m 245 2010-05-30 14:18:05Z  $ */

#import <objc/runtime.h>
#import "NLReflectionProperty.h"

@implementation NLReflectionProperty

@synthesize property;
@synthesize name;
@synthesize attributes;

+ ( id )reflectorFromProperty:( objc_property_t )prop
{
    id reflector = [ [ self alloc ] initWithProperty: prop ];
    
    return [ reflector autorelease ];
}

- ( NSString * )description
{
    NSString * description;
    
    description = [ [ super description ] stringByAppendingFormat: @"\n\t- property:\t%@\n\t- attributes:\t%@", name, attributes ];
    
    return description;
}

- ( id )initWithProperty:( objc_property_t )prop
{
    if( ( self = [ self init ] ) )
    {
        property   = prop;
        name       = [ [ NSString alloc ] initWithCString: property_getName( prop ) encoding: NSASCIIStringEncoding ];
        attributes = [ [ NSString alloc ] initWithCString: property_getAttributes( prop ) encoding: NSASCIIStringEncoding ];
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
