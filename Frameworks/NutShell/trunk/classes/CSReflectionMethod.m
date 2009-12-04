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

+ ( id )reflectorFromMethod:( Method )objcMethod
{
    id reflector = [ [ self alloc ] initWithMethod: objcMethod ];
    
    return [ reflector autorelease ];
}

- ( NSString * )description
{
    NSString * description;
    
    description = [ [ super description ] stringByAppendingFormat: @"\n\t- method:\t\t\t\t%@\n\t- type encoding:\t\t%@\n\t- number of arguments:\t%@\n\t- return type:\t\t%@", name, typeEncoding, numberOfArguments, returnType ];
    
    return description;
}

- ( id )initWithMethod:( Method )objcMethod
{
    NSMutableArray * args;
    int i;
    
    if( ( self = [ super init ] ) ) {
        
        method            = objcMethod;
        selector          = method_getName( method );
        name              = [ [ NSString alloc ] initWithCString: sel_getName( selector ) encoding: NSASCIIStringEncoding ];
        implementation    = method_getImplementation( method );
        typeEncoding      = [ [ NSString alloc ] initWithCString: method_getTypeEncoding( method ) encoding: NSASCIIStringEncoding ];
        returnType        = [ [ NSString alloc ] initWithCString: method_copyReturnType( method ) encoding: NSASCIIStringEncoding ];
        numberOfArguments = [ [ NSNumber alloc ] initWithInt: method_getNumberOfArguments( method ) ];
        
        args = [ NSMutableArray arrayWithCapacity: [ numberOfArguments intValue ] ];
        
        for( i = 0; i < [ numberOfArguments intValue ]; i++ ) {
            
            [ args addObject: [ NSString stringWithCString: method_copyArgumentType( method, i ) encoding: NSASCIIStringEncoding ] ];
        }
        
        arguments = [ [ NSArray arrayWithArray: args ] retain ];
    }
    
    return self;
}

/*!
 * @abstract    
 */
- ( BOOL )isEqual:( SEL )sel
{
    return sel_isEqual( selector, sel );
}

/*!
 * @abstract    
 */
- ( BOOL )isEqualToReflector:( CSReflectionMethod * )methodRef
{
    return sel_isEqual( selector, methodRef->selector );
}

- ( void )dealloc
{
    [ name release ];
    [ typeEncoding release ];
    [ returnType release ];
    [ numberOfArguments release ];
    [ arguments release ];
    [ super dealloc ];
}

@end
