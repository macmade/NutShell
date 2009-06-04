// $Id$

// Local includes
#import "MMObject.h"

/**
 * Types of the log messages
 */
enum {
    MMMessageLog   = 0,
    MMMessageDebug = 1
};

/**
 * Log message object
 *
 * @author      Jean-David Gadina <macmade@eosgarden.com>
 * @version     1.0
 */
@interface MMLogMessage: MMObject
{
    @protected
    
    /**
     * The message
     */
    NSString * message;
    
    /**
     * The message's date
     */
    NSDate * date;
    
    /**
     * The message's type
     */
    int type;
}

/**
 * Class properties
 */
@property( copy, readwrite ) NSString * message;
@property( copy, readwrite ) NSDate * date;
@property( assign, readwrite ) int type;

/**
 * 
 */
- ( id )initWithMessage: ( NSString * )message;

/**
 * 
 */
- ( id )initWithMessage: ( NSString * )message date: ( NSDate * )date;

/**
 * 
 */
- ( id )initWithMessage: ( NSString * )message date: ( NSDate * )date type: ( int )type;

@end
