// $Id$

// Used classes
@class MMEvent;

/**
 * NSObject additions (event dispatcher)
 *
 * @author      Jean-David Gadina <macmade@eosgarden.com>
 * @version     1.0
 */
@interface NSObject( MMEventDispatcher )

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
- ( void )dispatchEventObject: ( MMEvent * )event;

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
