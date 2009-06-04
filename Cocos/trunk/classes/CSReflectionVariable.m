/*******************************************************************************
 * Cocos Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

#import <objc/runtime.h>
#import "CSReflectionVariable.h"

@implementation CSReflectionVariable

@synthesize variable;
@synthesize name;
@synthesize typeEncoding;

+ ( id )reflectorFromVariable:( Ivar )var
{
    id reflector = [ [ self alloc ] initWithVariable: var ];
    
    return [ reflector autorelease ];
}

- ( NSString * )description
{
    NSString * description;
    
    description = [ [ super description ] stringByAppendingFormat: @"\n\t- variable:\t\t%@\n\t- type encoding:\t%@", name, typeEncoding ];
    
    return description;
}

- ( id )initWithVariable:( Ivar )var
{
    if( ( self = [ self init ] ) ) {
        
        variable     = var;
        name         = [ [ NSString alloc ] initWithCString: ivar_getName( var ) encoding: NSUTF8StringEncoding ];
        typeEncoding = [ [ NSString alloc ] initWithCString: ivar_getTypeEncoding( var ) encoding: NSUTF8StringEncoding ];
    }
    
    return self;
}

- ( void )dealloc
{
    [ name release ];
    [ typeEncoding release ];
    [ super dealloc ];
}


@end
