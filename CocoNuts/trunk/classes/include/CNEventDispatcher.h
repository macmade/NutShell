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
