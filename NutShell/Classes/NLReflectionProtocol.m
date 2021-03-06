/*******************************************************************************
 * Copyright (c) 2011, Jean-David Gadina - www.xs-labs.com
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

/* $Id: NLReflectionProtocol.m 245 2010-05-30 14:18:05Z  $ */

#import <objc/runtime.h>
#import "NLReflectionProtocol.h"
#import "NLReflectionProperty.h"

@implementation NLReflectionProtocol

@synthesize protocol;
@synthesize name;

+ ( id )reflectorFromProtocol:( Protocol * )proto
{
    id reflector = [ [ self alloc ] initWithProtocol: proto ];
    
    return [ reflector autorelease ];
}

+ ( id )reflectorFromProtocolName:( NSString * )protoName
{
    id reflector = [ [ self alloc ] initWithProtocolName: protoName ];
    
    return [ reflector autorelease ];
}

- ( NSString * )description
{
    NSString * description;
    
    description = [ [ super description ] stringByAppendingFormat: @"\n\t- protocol:\t%@", name ];
    
    return description;
}

- ( id )initWithProtocol:( Protocol * )proto
{
    if( proto && ( self = [ super init ] ) )
    {
        protocol = proto;
        name     = [ [ NSString alloc ] initWithCString: protocol_getName( proto ) encoding: NSASCIIStringEncoding ];
    }
    
    return self;
}

- ( id )initWithProtocolName:( NSString * )protoName
{
    return [ self initWithProtocol: NSProtocolFromString( protoName ) ];
}

- ( NSDictionary * )properties
{
    unsigned int propertyCount;
    objc_property_t * protocolProperties;
    NLReflectionProperty * property;
    NSMutableDictionary * propertyDict;
    unsigned int i;
    
    if( properties == nil )
    {
        protocolProperties = protocol_copyPropertyList( protocol, &propertyCount );
        
        if( protocolProperties != NULL && propertyCount > 0 )
        {
            propertyDict = [ NSMutableDictionary dictionaryWithCapacity: propertyCount ];
            
            for( i = 0; i < propertyCount; i++ )
            {
                property = [ NLReflectionProperty reflectorFromProperty: protocolProperties[ i ] ];
                
                [ propertyDict setObject: property forKey: [ property name ] ];
            }
            
            properties = [ [ NSDictionary dictionaryWithDictionary: propertyDict ] retain ];
        }
        
        free( protocolProperties );
    }
    
    return properties;
}

/*!
 * 
 */
- ( BOOL )isEqual:( Protocol * )proto
{
    return protocol_isEqual( protocol, proto );
}

/*!
 * 
 */
- ( BOOL )isEqualToReflector:( NLReflectionProtocol * )proto
{
    return protocol_isEqual( protocol, proto->protocol );
}

/*!
 * 
 */
- ( BOOL )conformsToProtocol:( Protocol * )proto
{
    return protocol_conformsToProtocol( protocol, proto );
}

/*!
 * 
 */
- ( BOOL )conformsToProtocolReflector:( NLReflectionProtocol * )proto
{
    return protocol_conformsToProtocol( protocol, proto->protocol );
}

- ( void )dealloc
{
    [ name release ];
    [ properties release ];
    [ super dealloc ];
}

@end
