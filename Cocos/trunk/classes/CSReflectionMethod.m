/*******************************************************************************
 * Cocos Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

#import "CSReflectionMethod.h"

@implementation CSReflectionMethod

@synthesize method;
@synthesize selector;
@synthesize name;
@synthesize implementation;
@synthesize typeEncoding;
@synthesize returnType;
@synthesize numberOfArguments;
@synthesize arguments;

/*!
 * @abstract    
 */
+ ( id )reflectorFromMethod:( Method )objcMethod
{
    id reflector = [ [ self alloc ] initWithMethod: objcMethod ];
    
    return [ reflector autorelease ];
}

/*!
 * @abstract    
 */
- ( id )initWithMethod:( Method )objcMethod
{
    if( ( self = [ super init ] ) ) {
        
        // ...
    }
    
    return self;
}

@end
