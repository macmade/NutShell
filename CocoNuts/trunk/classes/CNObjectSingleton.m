// $Id$

// Local includes
#import "CNObjectSingleton.h"

@implementation CNObjectSingleton

static NSMutableDictionary * _instances;

+ ( id )getInstance
{
    @synchronized( self ) {
        
        if( [ _instances objectForKey: NSStringFromClass( [ self class ] ) ] == nil ) {
            
            [ [ self alloc ] init ];
        }
    }
    
    return [ _instances objectForKey: NSStringFromClass( [ self class ] ) ];
}

+ ( id )allocWithZone:( NSZone * )zone 
{
    @synchronized( self ) {
        
        if( _instances == nil ) {
            
            _instances = [ [ NSMutableDictionary dictionaryWithCapacity: 100 ] retain ];
        }
        
        if( [ _instances objectForKey: NSStringFromClass( [ self class ] ) ] == nil ) {
            
            [ _instances setObject: [ super allocWithZone: zone ] forKey: NSStringFromClass( [ self class ] ) ];
            
            return [ _instances objectForKey: NSStringFromClass( [ self class ] ) ];
        }
    }
    
    return nil;
}

- ( id )copyWithZone:( NSZone * )zone 
{
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

@end
