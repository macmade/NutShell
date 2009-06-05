/*******************************************************************************
 * Cocos Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

#import <objc/runtime.h>
#import "CSReflectionClass.h"
#import "CSReflectionVariable.h"
#import "CSReflectionProperty.h"
#import "CSReflectionProtocol.h"
#import "CSReflectionMethod.h"

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

- ( NSString * )description
{
    NSString * description;
    
    description = [ [ super description ] stringByAppendingFormat: @"\n\t- class:\t\t\t%@\n\t- instance size:\t%@\n\t- meta class:\t\t%i", name, instanceSize, metaClass ];
    
    return description;
}

- ( id )initWithClass: ( Class )objectivecClass
{
    if( objectivecClass && ( self = [ super init ] ) ) {
        
        objcClass    = objectivecClass;
        name         = [ [ NSString alloc ] initWithCString: class_getName( objcClass ) encoding: NSASCIIStringEncoding ];
        metaClass    = class_isMetaClass( objcClass );
        instanceSize = [ [ NSNumber alloc ] initWithInt: class_getInstanceSize( objcClass ) ];
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
    [ name release ];
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
    unsigned int variableCount;
    Ivar * classVariables;
    CSReflectionProperty * variable;
    NSMutableDictionary * variableDict;
    unsigned int i;
    
    if( properties == nil ) {
        
        classVariables = class_copyIvarList( objcClass, &variableCount );
        
        if( classVariables != NULL && variableCount > 0 ) {
            
            variableDict = [ NSMutableDictionary dictionaryWithCapacity: variableCount ];
            
            for( i = 0; i < variableCount; i++ ) {
                
                variable = [ CSReflectionVariable reflectorFromVariable: classVariables[ i ] ];
                
                [ variableDict setObject: variable forKey: [ variable name ] ];
            }
            
            instanceVariables = [ [ NSDictionary dictionaryWithDictionary: variableDict ] retain ];
        }
        
        free( classVariables );
    }
    
    return instanceVariables;
}

- ( NSDictionary * )properties
{
    unsigned int propertyCount;
    objc_property_t * classProperties;
    CSReflectionProperty * property;
    NSMutableDictionary * propertyDict;
    unsigned int i;
    
    if( properties == nil ) {
        
        classProperties = class_copyPropertyList( objcClass, &propertyCount );
        
        if( classProperties != NULL && propertyCount > 0 ) {
            
            propertyDict = [ NSMutableDictionary dictionaryWithCapacity: propertyCount ];
            
            for( i = 0; i < propertyCount; i++ ) {
                
                property = [ CSReflectionProperty reflectorFromProperty: classProperties[ i ] ];
                
                [ propertyDict setObject: property forKey: [ property name ] ];
            }
            
            properties = [ [ NSDictionary dictionaryWithDictionary: propertyDict ] retain ];
        }
        
        free( classProperties );
    }
    
    return properties;
}

- ( NSDictionary * )instanceMethods
{
    unsigned int methodCount;
    Method * methods;
    CSReflectionMethod * method;
    NSMutableDictionary * methodDict;
    unsigned int i;
    
    if( instanceMethods == nil ) {
        
        methods = class_copyMethodList( objcClass, &methodCount );
        
        if( methods != NULL && methodCount > 0 ) {
            
            methodDict = [ NSMutableDictionary dictionaryWithCapacity: methodCount ];
            
            for( i = 0; i < methodCount; i++ ) {
                
                method = [ CSReflectionMethod reflectorFromMethod: methods[ i ] ];
                
                [ methodDict setObject: method forKey: [ method name ] ];
            }
            
            instanceMethods = [ [ NSDictionary dictionaryWithDictionary: methodDict ] retain ];
        }
        
        free( methods );
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
        
        if( classProtocols != NULL && protocolCount > 0 ) {
            
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
