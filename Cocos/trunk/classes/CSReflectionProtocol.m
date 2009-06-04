/*******************************************************************************
 * Cocos Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

#import <objc/runtime.h>
#import "CSReflectionProtocol.h"
#import "CSReflectionProperty.h"

@implementation CSReflectionProtocol

@synthesize protocol;
@synthesize name;

+ ( id )reflectorFromProtocol:( Protocol * )proto
{
    id reflector = [ [ self alloc ] initWithProtocol: proto ];
    
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
    if( proto && ( self = [ super init ] ) ) {
        
        protocol = proto;
        name     = NSStringFromProtocol( proto );
    }
    
    return self;
}

- ( NSDictionary * )properties
{
    unsigned int propertyCount;
    objc_property_t * protocolProperties;
    CSReflectionProperty * property;
    NSMutableDictionary * propertyDict;
    unsigned int i;
    
    if( properties == nil ) {
        
        protocolProperties = protocol_copyPropertyList( protocol, &propertyCount );
        
        if( protocolProperties != NULL && propertyCount > 0 ) {
            
            propertyDict = [ NSMutableDictionary dictionaryWithCapacity: propertyCount ];
            
            for( i = 0; i < propertyCount; i++ ) {
                
                property = [ CSReflectionProperty reflectorFromProperty: protocolProperties[ i ] ];
                
                [ propertyDict setObject: property forKey: [ property name ] ];
            }
            
            properties = [ [ NSDictionary dictionaryWithDictionary: propertyDict ] retain ];
        }
        
        free( protocolProperties );
    }
    
    return properties;
}

- ( void )dealloc
{
    [ super dealloc ];
}

@end
