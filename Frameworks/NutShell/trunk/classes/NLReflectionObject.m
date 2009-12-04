/*******************************************************************************
 * Cocos Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

#import <objc/runtime.h>
#import "CSReflectionObject.h"
#import "CSReflectionClass.h"

@implementation CSReflectionObject

@synthesize classReflector;
@synthesize classname;

+ ( id )reflectorFromObject:( id )object
{
    id reflector = [ [ self alloc ] initWithObject: object ];
    
    return [ reflector autorelease ];
}

- ( NSString * )description
{
    NSString * description;
    
    description = [ [ super description ] stringByAppendingFormat: @"\n\t- classname:\t%@", classname ];
    
    return description;
}

- ( id )initWithObject:( id )object
{
    if( ( self = [ super init ] ) ) {
        
        classReflector = [ [ CSReflectionClass alloc ] initWithClass: [ object class ] ];
        classname      = [ [ NSString alloc ] initWithString: [ classReflector name ] ];
    }
    
    return self;
}

- ( void )dealloc
{
    [ classReflector release ];
    [ classname release ];
    [ super dealloc ];
}

@end
