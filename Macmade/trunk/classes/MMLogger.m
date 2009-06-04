// $Id$

// Local includes
#import "MMLogger.h"
#import "MMLogMessage.h"
#import "MMEventDispatcher.h"

/**
 * Logger
 *
 * @author      Jean-David Gadina <macmade@eosgarden.com>
 * @version     1.0
 */
@implementation MMLogger

/**
 * Automatic getters/setters
 */
@synthesize messages;
@synthesize enableDebug;

/**
 * Object initialization
 * 
 * @return  id      The object's instance
 */
- ( id )init
{
    if( ( self = [ super init ] ) ) {
        
        messages = [ [ NSMutableArray arrayWithCapacity: 100 ] retain ];
    }
    
    return self;
}

/**
 * Adds a message
 * 
 * @param   LogMessage *    The message to add
 * @return  void
 */
- ( void )message: ( MMLogMessage * ) message
{
    [ messages addObject: message ];
    
    [ self dispatchEvent: @"MessageReceived" ];
}

/**
 * Adds a log message
 * 
 * @param   NSString *  The log message
 * @return  void
 */
- ( void )log: ( NSString * )message
{
   MMLogMessage * msg;
    
    msg = [ [ MMLogMessage alloc ] initWithMessage: message ];
    
    [ messages addObject: msg ];
    
    [ self dispatchEvent: @"MessageReceived" ];
}

/**
 * Adds a debug message
 * 
 * @param   NSString *  The debug message
 * @return  void
 */
- ( void )debug: ( NSString * )message
{
    MMLogMessage * msg;
    
    if( enableDebug == YES ) {
        
        msg      = [ [ MMLogMessage alloc ] initWithMessage: message ];
        msg.type = MMMessageDebug;
        
        [ messages addObject: msg ];
        
        [ self dispatchEvent: @"MessageReceived" ];
    }
}

/**
 * Clears the log messages
 * 
 * @return  void
 */
- ( void )clear
{
    [ messages removeAllObjects ];
    
    [ self dispatchEvent: @"MessageCleared" ];
}

@end
