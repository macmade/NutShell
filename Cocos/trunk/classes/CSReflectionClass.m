/*******************************************************************************
 * Cocos Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

#import <objc/runtime.h>
#import "CSReflectionClass.h"
#import "CSReflectionProtocol.h"

@implementation CSReflectionClass

@synthesize objcClass;
@synthesize name;
@synthesize metaClass;
@synthesize instanceSize;

+ ( id )reflectorFromClass: ( Class )objectivecClass
{
    id reflector = [ [ self alloc ] initWithClass: objectivecClass ];
    
    return [ reflector autorelease ];
}

+ ( id )reflectorFromClassname: ( NSString * )classname
{
    id reflector = [ [ self alloc ] initWithClassname: classname ];
    
    return [ reflector autorelease ];
}

+ ( id )reflectorFromObject: ( id )object
{
    id reflector = [ [ self alloc ] initWithObject: object ];
    
    return [ reflector autorelease ];
}

- ( id )initWithClass: ( Class )objectivecClass
{
    if( objectivecClass && ( self = [ super init ] ) ) {
        
        objcClass    = objectivecClass;
        name         = NSStringFromClass( objectivecClass );
        metaClass    = class_isMetaClass( objcClass );
        instanceSize = [ [ NSNumber alloc ] initWithInteger: class_getInstanceSize( objcClass ) ];
    }
    
    return self;
}

- ( id )initWithClassname: ( NSString * )classname
{
    return [ self initWithClass: NSClassFromString( classname ) ];
}

- ( id )initWithObject: ( id )object
{
    return [ self initWithClass: [ object class ] ];
}

- ( void )dealloc
{
    [ superClass release ];
    [ instanceSize release ];
    [ instanceVariables release ];
    [ properties release ];
    [ instanceMethods release ];
    [ protocols release ];
    [ super dealloc ];
}

- ( CSReflectionClass * )superClass
{
    if( superClass == nil ) {
        
        superClass = [ [ CSReflectionClass alloc ] initWithClass: class_getSuperclass( objcClass ) ];
    }
    
    return superClass;
}

- ( NSDictionary * )instanceVariables
{
    if( instanceVariables == nil ) {
        
        
    }
    
    return instanceVariables;
}

- ( NSDictionary * )properties
{
    if( properties == nil ) {
        
        
    }
    
    return properties;
}

- ( NSDictionary * )instanceMethods
{
    if( instanceMethods == nil ) {
        
        
    }
    
    return instanceMethods;
}

- ( NSDictionary * )protocols
{
    unsigned int protocolCount;
    Protocol ** classProtocols;
    CSReflectionProtocol * protocol;
    NSMutableDictionary * protocolDict;
    unsigned int i;
    
    if( protocols == nil ) {
        
        classProtocols = class_copyProtocolList( objcClass, &protocolCount );
        
        if( classProtocols != NULL && ( protocolCount > 0 ) ) {
            
            protocolDict = [ NSMutableDictionary dictionaryWithCapacity: protocolCount ];
            
            for( i = 0; i < protocolCount; i++ ) {
                
                protocol = [ CSReflectionProtocol reflectorFromProtocol: classProtocols[ i ] ];
                
                [ protocolDict setObject: protocol forKey: [ protocol name ] ];
            }
            
            protocols = [ [ NSDictionary dictionaryWithDictionary: protocolDict ] retain ];
        }
        
        free( classProtocols );
    }
    
    return protocols;
}

@end