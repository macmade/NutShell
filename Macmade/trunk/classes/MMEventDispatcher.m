// $Id$

// Local includes
#import "MMEventDispatcher.h"
#import "MMEvent.h"

/**
 * NSObject additions (event dispatcher)
 *
 * @author      Jean-David Gadina <macmade@eosgarden.com>
 * @version     1.0
 */
@implementation NSObject( MMEventDispatcher )

// A dictionary with the registered events for all Objective-C class instances
static NSMutableDictionary * _events;

/**
 * 
 */
- ( void )dispatchEvent: ( NSString * )name
{
    [ self dispatchEvent: name target: self ];
}

/**
 * 
 */
- ( void )dispatchEvent: ( NSString * )name target: ( id )target
{
    MMEvent * event;
    event = [ [ MMEvent alloc ] initWithName: name target: target ];
    
    [ self dispatchEventObject: event ];
    
    [ event release ];
}

/**
 * 
 */
- ( void )dispatchEventObject: ( MMEvent * )event
{
    NSString * classname;
    NSString * instanceId;
    NSMutableDictionary * instances;
    NSMutableDictionary * events;
    NSMutableDictionary * priorities;
    NSEnumerator * priorityEnumerator;
    NSEnumerator * listenerEnumerator;
    NSMutableArray * listeners;
    NSDictionary * listener;
    id target;
    SEL selector;
    
    if( _events == nil ) {
        
        return;
    }
    
    classname  = NSStringFromClass( [ self class ] );
    instanceId = [ [ NSNumber numberWithInteger: ( int )self ] stringValue ];
    
    instances = [ _events objectForKey: classname ];
    
    if( instances == nil ) {
        
        return;
    }
    
    events = [ instances objectForKey: instanceId ];
    
    if( events == nil ) {
        
        return;
    }
    
    priorities = [ events objectForKey: event.name ];
    
    if( priorities == nil ) {
        
        return;
    }
    
    priorityEnumerator = [ priorities objectEnumerator ];
    
    while( ( listeners = [ priorityEnumerator nextObject ] ) && event.propagating == YES ) {
        
        listenerEnumerator = [ listeners objectEnumerator ];
        
        while( ( listener = [ listenerEnumerator nextObject ] ) && event.propagating == YES ) {
            
            target   = [ listener objectForKey: @"target" ];
            selector = NSSelectorFromString( [ listener objectForKey: @"selector" ] );
            
            [ target performSelector: selector withObject: event ];
        }
    }
}

/**
 * 
 */
- ( int )addEventListener: ( NSString * )name target: ( id )target selector: ( SEL )selector
{
    return [ self addEventListener: name target: target selector: selector priority: 255 ];
}

/**
 * 
 */
- ( int )addEventListener: ( NSString * )name target: ( id )target selector: ( SEL )selector priority: ( int )priority
{
    NSString * classname;
    NSString * instanceId;
    NSString * priorityKey;
    NSMutableDictionary * instances;
    NSMutableDictionary * events;
    NSMutableDictionary * priorities;
    NSMutableArray * listeners;
    NSDictionary * listener;
    
    if( _events == nil ) {
        
        _events = [ [ NSMutableDictionary dictionaryWithCapacity: 10 ] retain ];
    }
    
    classname   = NSStringFromClass( [ self class ] );
    instanceId  = [ [ NSNumber numberWithInteger: ( int )self ] stringValue ];
    priorityKey = [ [ NSNumber numberWithInteger: priority ] stringValue ];
    
    instances = [ _events objectForKey: classname ];
    
    if( instances == nil ) {
        
        instances = [ [ NSMutableDictionary dictionaryWithCapacity: 10 ] retain ];
        
        [ _events setObject: instances forKey: classname ];
    }
    
    events = [ instances objectForKey: instanceId ];
    
    if( events == nil ) {
        
        events = [ [ NSMutableDictionary dictionaryWithCapacity: 10 ] retain ];
        
        [ instances setObject: events forKey: instanceId ];
    }
    
    priorities = [ events objectForKey: name ];
    
    if( priorities == nil ) {
        
        priorities = [ [ NSMutableDictionary dictionaryWithCapacity: 10 ] retain ];
        
        [ events setObject: priorities forKey: name ];
    }
    
    listeners = [ priorities objectForKey: priorityKey ];
    
    if( listeners == nil ) {
        
        listeners = [ [ NSMutableArray arrayWithCapacity: 10 ] retain ];
        
        [ priorities setObject: listeners forKey: priorityKey ];
    }
    
    listener = [ NSDictionary dictionaryWithObjectsAndKeys: target, @"target", NSStringFromSelector( selector ), @"selector", nil ];
    
    [ listeners addObject: listener ];
    
    return [ listeners count ] - 1;
}

/**
 * 
 */
- ( BOOL )hasEventListener: ( NSString * )name
{
    NSString * classname;
    NSString * instanceId;
    NSMutableDictionary * instances;
    NSMutableDictionary * events;
    
    if( _events == nil ) {
        
        return NO;
    }
    
    classname  = NSStringFromClass( [ self class ] );
    instanceId = [ [ NSNumber numberWithInteger: ( int )self ] stringValue ];
    
    instances  = [ _events objectForKey: classname ];
    
    if( instances == nil ) {
        
        return NO;
    }
    
    events = [ instances objectForKey: instanceId ];
    
    if( events == nil ) {
        
        return NO;
    }
    
    if( [ events objectForKey: name ] == nil ) {
        
        return NO;
    }
    
    return YES;
}

@end
