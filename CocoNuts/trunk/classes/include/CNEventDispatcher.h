/*******************************************************************************
 * CocoNuts Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 * 
 * This file should not be included directly by application source files using
 * the CocoNuts framework. Including 'CocoNuts.h' is preferred over importing
 * individual files because it will use a precompiled version.
 ******************************************************************************/

// $Id$

// Used classes
@class CNEvent;

/**
 * NSObject additions (event dispatcher)
 *
 * @author      Jean-David Gadina <macmade@eosgarden.com>
 * @version     1.0
 */
@interface NSObject( CNEventDispatcher )

/**
 * 
 */
- ( void )dispatchEvent: ( NSString * )name;

/**
 * 
 */
- ( void )dispatchEvent: ( NSString * )name target: ( id )target;

/**
 * 
 */
- ( void )dispatchEventObject: ( CNEvent * )event;

/**
 * 
 */
- ( int )addEventListener: ( NSString * )name target: ( id )target selector: ( SEL )selector;

/**
 * 
 */
- ( int )addEventListener: ( NSString * )name target: ( id )target selector: ( SEL )selector priority: ( int )priority;

/**
 * 
 */
- ( BOOL )hasEventListener: ( NSString * )name;

@end
