/*******************************************************************************
 * Cocos Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

#import "NLObjectSingleton.h"

@implementation NLObjectSingleton

static NSMutableDictionary * _instances;

+ ( id )getInstance
{
    @synchronized( self )
    {
        if( [ _instances objectForKey: NSStringFromClass( [ self class ] ) ] == nil )
        {
            [ [ [ self alloc ] init ] csInit ];
        }
    }
    
    return [ _instances objectForKey: NSStringFromClass( [ self class ] ) ];
}

+ ( id )allocWithZone:( NSZone * )zone 
{
    @synchronized( self )
    {
        if( _instances == nil )
        {
            _instances = [ [ NSMutableDictionary dictionaryWithCapacity: 100 ] retain ];
        }
        
        if( [ _instances objectForKey: NSStringFromClass( [ self class ] ) ] == nil )
        {
            [ _instances setObject: [ super allocWithZone: zone ] forKey: NSStringFromClass( [ self class ] ) ];
        }
        
        return [ _instances objectForKey: NSStringFromClass( [ self class ] ) ];
    }
    
    return nil;
}

- ( id )copyWithZone:( NSZone * )zone 
{
    ( void )zone;
    
    return self;
}

- ( id )retain
{
    return self;
}

- ( unsigned )retainCount
{
    return UINT_MAX;
}

- ( void )release
{}

- ( id )autorelease
{
    return self;
}

- ( BOOL )isInited
{
    return NL_inited;
}

- ( id )csInit
{
    NL_inited = YES;
    
    return self;
}

@end
