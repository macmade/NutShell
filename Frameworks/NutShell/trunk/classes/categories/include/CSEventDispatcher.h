/*******************************************************************************
 * Cocos Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

/*!
 * @header
 * 
 * @discussion  This file should not be included directly by application source
 *              files using the Cocos framework. Including 'Cocos.h' is
 *              preferred over importing individual files because it will use a
 *              precompiled version.
 */

// Used classes
@class CSEvent;

/*!
 * @abstract    NSObject additions to provide an event dispatcher on all Cocoa objects
 * 
 * @version     1.0
 * @namespace   Cocos
 */
@interface NSObject( CSEventDispatcher )

/*!
 * @abstract    Dispatches a named event
 * 
 * @param       name    The name of the event to dispatch
 " @return      void
 */
- ( void )dispatchEvent: ( NSString * )name;

/*!
 * @abstract    Dispatches an named event with a specific target
 * 
 * @param       name    The name of the event to dispatch
 * @param       target  The event's target object
 " @return      void
 */
- ( void )dispatchEvent: ( NSString * )name target: ( id )target;

/*!
 * @abstract    Dispatches an event object
 * 
 * @param       event   The event object to dispatch
 " @return      void
 */
- ( void )dispatchEventObject: ( CSEvent * )event;

/*!
 * @abstract    Adds an event listener on an event of the current object
 * 
 * @param       name        The name of the event to listen
 * @param       target      The target class instance
 * @param       selector    The selector for the method of the target
 " @return      void
 */
- ( int )addEventListener: ( NSString * )name target: ( id )target selector: ( SEL )selector;

/*!
 * @abstract    Adds an event listener on an event of the current object
 * 
 * @param       name        The name of the event to listen
 * @param       target      The target class instance
 * @param       selector    The selector for the method of the target
 * @param       priority    The priority of the event listener
 " @return      void
 */
- ( int )addEventListener: ( NSString * )name target: ( id )target selector: ( SEL )selector priority: ( int )priority;

/*!
 * @abstract    Checks if the object has event listener(s) for a specific event
 * 
 * @param       name    The name of the event for which to check for event listeners
 " @return      True if the object has event listener(s) for the specified event, otherwise false
 */
- ( BOOL )hasEventListener: ( NSString * )name;

@end
