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

/* $Id: NLEventDispatcher.m 252 2011-01-19 08:54:54Z macmade $ */

#import "NLEventDispatcher.h"
#import "NLEvent.h"

@implementation NSObject( NLEventDispatcher )

static NSMutableDictionary * _events;

- ( void )dispatchEvent: ( NSString * )name
{
    [ self dispatchEvent: name target: self ];
}

- ( void )dispatchEvent: ( NSString * )name target: ( id )target
{
    NLEvent * event;
    event = [ [ NLEvent alloc ] initWithName: name target: target ];
    
    [ self dispatchEventObject: event ];
    
    [ event release ];
}

- ( void )dispatchEventObject: ( NLEvent * )event
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
    
    if( _events == nil )
    {
        return;
    }
    
    classname  = NSStringFromClass( [ self class ] );
    instanceId = [ [ NSNumber numberWithUnsignedLongLong: ( uintptr_t )self ] stringValue ];
    
    instances = [ _events objectForKey: classname ];
    
    if( instances == nil )
    {
        return;
    }
    
    events = [ instances objectForKey: instanceId ];
    
    if( events == nil )
    {
        return;
    }
    
    priorities = [ events objectForKey: event.name ];
    
    if( priorities == nil )
    {
        return;
    }
    
    priorityEnumerator = [ priorities objectEnumerator ];
    
    while( ( listeners = [ priorityEnumerator nextObject ] ) && event.propagating == YES )
    {
        listenerEnumerator = [ listeners objectEnumerator ];
        
        while( ( listener = [ listenerEnumerator nextObject ] ) && event.propagating == YES )
        {
            target   = [ listener objectForKey: @"target" ];
            selector = NSSelectorFromString( [ listener objectForKey: @"selector" ] );
            
            [ target performSelector: selector withObject: event ];
        }
    }
}

- ( NSUInteger )addEventListener: ( NSString * )name target: ( id )target selector: ( SEL )selector
{
    return [ self addEventListener: name target: target selector: selector priority: 255 ];
}

- ( NSUInteger )addEventListener: ( NSString * )name target: ( id )target selector: ( SEL )selector priority: ( int )priority
{
    NSString            * classname;
    NSString            * instanceId;
    NSString            * priorityKey;
    NSMutableDictionary * instances;
    NSMutableDictionary * events;
    NSMutableDictionary * priorities;
    NSMutableArray      * listeners;
    NSDictionary        * listener;
    
    if( _events == nil )
    {
        _events = [ [ NSMutableDictionary dictionaryWithCapacity: 10 ] retain ];
    }
    
    classname   = NSStringFromClass( [ self class ] );
    instanceId  = [ [ NSNumber numberWithUnsignedLongLong: ( uintptr_t )self ] stringValue ];
    priorityKey = [ [ NSNumber numberWithInteger: priority ] stringValue ];
    
    instances = [ _events objectForKey: classname ];
    
    if( instances == nil ) {
        
        instances = [ NSMutableDictionary dictionaryWithCapacity: 10 ];
        
        [ _events setObject: instances forKey: classname ];
    }
    
    events = [ instances objectForKey: instanceId ];
    
    if( events == nil )
    {
        events = [ NSMutableDictionary dictionaryWithCapacity: 10 ];
        
        [ instances setObject: events forKey: instanceId ];
    }
    
    priorities = [ events objectForKey: name ];
    
    if( priorities == nil )
    {
        priorities = [ NSMutableDictionary dictionaryWithCapacity: 10 ];
        
        [ events setObject: priorities forKey: name ];
    }
    
    listeners = [ priorities objectForKey: priorityKey ];
    
    if( listeners == nil )
    {
        listeners = [ NSMutableArray arrayWithCapacity: 10 ];
        
        [ priorities setObject: listeners forKey: priorityKey ];
    }
    
    listener = [ NSDictionary dictionaryWithObjectsAndKeys: target, @"target", NSStringFromSelector( selector ), @"selector", nil ];
    
    [ listeners addObject: listener ];
    
    return [ listeners count ] - 1;
}

- ( BOOL )hasEventListener: ( NSString * )name
{
    NSString * classname;
    NSString * instanceId;
    NSMutableDictionary * instances;
    NSMutableDictionary * events;
    
    if( _events == nil )
    {
        return NO;
    }
    
    classname  = NSStringFromClass( [ self class ] );
    instanceId = [ [ NSNumber numberWithUnsignedLongLong: ( uintptr_t )self ] stringValue ];
    
    instances  = [ _events objectForKey: classname ];
    
    if( instances == nil )
    {
        return NO;
    }
    
    events = [ instances objectForKey: instanceId ];
    
    if( events == nil )
    {
        return NO;
    }
    
    if( [ events objectForKey: name ] == nil )
    {
        return NO;
    }
    
    return YES;
}

@end
