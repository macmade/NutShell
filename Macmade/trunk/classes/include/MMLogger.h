// $Id$

// Local includes
#import "MMObjectSingleton.h"

// Used classes
@class MMLogMessage;

/**
 * Logger
 *
 * @author      Jean-David Gadina <macmade@eosgarden.com>
 * @version     1.0
 */
@interface MMLogger: MMObjectSingleton
{
    @protected
    
    /**
     * An array with the messages
     */
    NSMutableArray * messages;
    
    /**
     * 
     */
    BOOL enableDebug;
}

/**
 * Class properties
 */
@property( readonly ) NSMutableArray * messages;
@property( assign, readwrite ) BOOL enableDebug;

/**
 * Adds a message
 * 
 * @param   LogMessage *    The message to add
 * @return  void
 */
- ( void )message: ( MMLogMessage * ) message;

/**
 * Adds a log message
 * 
 * @param   NSString *  The log message
 * @return  void
 */
- ( void )log: ( NSString * )message;

/**
 * Adds a debug message
 * 
 * @param   NSString *  The debug message
 * @return  void
 */
- ( void )debug: ( NSString * )message;

/**
 * Clears the log messages
 * 
 * @return  void
 */
- ( void )clear;

@end