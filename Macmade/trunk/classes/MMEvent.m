// $Id$

// Local includes
#import "MMEvent.h"

/**
 * Event object
 *
 * @author      Jean-David Gadina <macmade@eosgarden.com>
 * @version     1.0
 */
@implementation MMEvent

/**
 * Automatic getters/setters
 */
@synthesize propagating;
@synthesize target;
@synthesize name;

/**
 * Initializes a newly allocated event
 * 
 * @return  id      The instance of the event object
 */
- ( id ) init
{
    if( ( self = [ super init ] ) ) {
        
        propagating = YES;
    }
    
    return self;
}

/**
 * Initializes a newly allocated event with a specific name
 * 
 * @param   NSString *  The event's name
 * @return  id          The instance of the event object
 */
- ( id )initWithName: ( NSString * )eventName
{
    if( ( self = [ self init ] ) ) {
        
        name = [ eventName copy ];
    }
    
    return self;
}

/**
 * Initializes a newly allocated event with a target object
 * 
 * @param   id      The target object
 * @return  id      The instance of the event object
 */
- ( id )initWithTarget: ( id )targetObject
{
    if( ( self = [ self init ] ) ) {
        
        target = targetObject;
    }
    
    return self;
}

/**
 * Initializes a newly allocated event with a specific name and a target object
 * 
 * @param   NSString *  The event's name
 * @param   id          The target object
 * @return  id          The instance of the event object
 */
- ( id )initWithName: ( NSString * )eventName target: (id)targetObject
{
    if( ( self = [ self init ] ) ) {
        
        name   = [ eventName copy ];
        target = targetObject;
    }
    
    return self;
}

@end