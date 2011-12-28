/*******************************************************************************
 * Copyright (c) 2011, Jean-David Gadina <macmade@eosgarden.com>
 * Distributed under the Boost Software License, Version 1.0.
 * 
 * Boost Software License - Version 1.0 - August 17th, 2003
 * 
 * Permission is hereby granted, free of charge, to any person or organization
 * obtaining a copy of the software and accompanying documentation covered by
 * this license (the "Software") to use, reproduce, display, distribute,
 * execute, and transmit the Software, and to prepare derivative works of the
 * Software, and to permit third-parties to whom the Software is furnished to
 * do so, all subject to the following:
 * 
 * The copyright notices in the Software and this entire statement, including
 * the above license grant, this restriction and the following disclaimer,
 * must be included in all copies of the Software, in whole or in part, and
 * all derivative works of the Software, unless such copies or derivative
 * works are solely in the form of machine-executable object code generated by
 * a source language processor.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
 * SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
 * FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
 * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 ******************************************************************************/

/* $Id: NLReflectionClass.m 248 2010-08-25 14:12:28Z  $ */

#import <objc/runtime.h>
#import "NLReflectionClass.h"
#import "NLReflectionVariable.h"
#import "NLReflectionProperty.h"
#import "NLReflectionProtocol.h"
#import "NLReflectionMethod.h"

@implementation NLReflectionClass

@synthesize objcClass;
@synthesize name;
@synthesize metaClass;
@synthesize instanceSize;
@synthesize version;
@synthesize instanceVariableLayout;
@synthesize weakInstanceVariableLayout;

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
    if( objectivecClass && ( self = [ super init ] ) )
    {
        objcClass                  = objectivecClass;
        name                       = [ [ NSString alloc ] initWithCString: class_getName( objcClass ) encoding: NSASCIIStringEncoding ];
        metaClass                  = class_isMetaClass( objcClass );
        instanceSize               = [ [ NSNumber alloc ] initWithUnsignedLongLong: class_getInstanceSize( objcClass ) ];
        version                    = [ [ NSNumber alloc ] initWithInt: class_getVersion( objcClass ) ];
        instanceVariableLayout     = [ [ NSString alloc ] initWithCString: ( const char * )class_getIvarLayout( objcClass ) encoding: NSASCIIStringEncoding ];
        weakInstanceVariableLayout = [ [ NSString alloc ] initWithCString: ( const char * )class_getWeakIvarLayout( objcClass ) encoding: NSASCIIStringEncoding ];
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
    [ instanceVariableLayout release ];
    [ weakInstanceVariableLayout release ];
    [ properties release ];
    [ instanceMethods release ];
    [ protocols release ];
    [ super dealloc ];
}

- ( NLReflectionClass * )superClass
{
    if( superClass == nil )
    {
        superClass = [ [ NLReflectionClass alloc ] initWithClass: class_getSuperclass( objcClass ) ];
    }
    
    return superClass;
}

- ( NSDictionary * )instanceVariables
{
    unsigned int variableCount;
    Ivar * classVariables;
    NLReflectionProperty * variable;
    NSMutableDictionary * variableDict;
    unsigned int i;
    
    if( properties == nil )
    {
        classVariables = class_copyIvarList( objcClass, &variableCount );
        
        if( classVariables != NULL && variableCount > 0 )
        {
            variableDict = [ NSMutableDictionary dictionaryWithCapacity: variableCount ];
            
            for( i = 0; i < variableCount; i++ )
            {
                variable = [ NLReflectionVariable reflectorFromVariable: classVariables[ i ] ];
                
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
    NLReflectionProperty * property;
    NSMutableDictionary * propertyDict;
    unsigned int i;
    
    if( properties == nil )
    {
        classProperties = class_copyPropertyList( objcClass, &propertyCount );
        
        if( classProperties != NULL && propertyCount > 0 )
        {
            propertyDict = [ NSMutableDictionary dictionaryWithCapacity: propertyCount ];
            
            for( i = 0; i < propertyCount; i++ )
            {
                property = [ NLReflectionProperty reflectorFromProperty: classProperties[ i ] ];
                
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
    NLReflectionMethod * method;
    NSMutableDictionary * methodDict;
    unsigned int i;
    
    if( instanceMethods == nil )
    {
        methods = class_copyMethodList( objcClass, &methodCount );
        
        if( methods != NULL && methodCount > 0 )
        {
            methodDict = [ NSMutableDictionary dictionaryWithCapacity: methodCount ];
            
            for( i = 0; i < methodCount; i++ )
            {
                method = [ NLReflectionMethod reflectorFromMethod: methods[ i ] ];
                
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
    NLReflectionProtocol * protocol;
    NSMutableDictionary * protocolDict;
    unsigned int i;
    
    if( protocols == nil )
    {
        classProtocols = class_copyProtocolList( objcClass, &protocolCount );
        
        if( classProtocols != NULL && protocolCount > 0 )
        {
            protocolDict = [ NSMutableDictionary dictionaryWithCapacity: protocolCount ];
            
            for( i = 0; i < protocolCount; i++ )
            {
                protocol = [ NLReflectionProtocol reflectorFromProtocol: classProtocols[ i ] ];
                
                [ protocolDict setObject: protocol forKey: [ protocol name ] ];
            }
            
            protocols = [ [ NSDictionary dictionaryWithDictionary: protocolDict ] retain ];
        }
        
        free( classProtocols );
    }
    
    return protocols;
}

- ( BOOL )respondsToSelector: ( SEL )selector
{
    return class_respondsToSelector( objcClass, selector );
}

- ( BOOL )respondsToMethodReflector: ( NLReflectionMethod * )reflector
{
    return class_respondsToSelector( objcClass, [ reflector selector ] );
}

- ( BOOL )conformsToProtocol: ( Protocol * )protocol
{
    return class_conformsToProtocol( objcClass, protocol );
}

- ( BOOL )conformsToProtocolReflector: ( NLReflectionProtocol * )reflector
{
    return class_conformsToProtocol( objcClass, ( Protocol * )[ reflector protocol ] );
}

- ( id )createInstance: ( size_t )extraBytes
{
    return class_createInstance( objcClass, extraBytes );
}

@end
