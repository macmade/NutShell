/*******************************************************************************
 * CocoNuts Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

// Local includes
#import "CNLogger.h"
#import "CNLogMessage.h"
#import "CNEventDispatcher.h"

/**
 * Logger
 *
 * @author      Jean-David Gadina <macmade@eosgarden.com>
 * @version     1.0
 */
@implementation CNLogger

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
- ( void )message: ( CNLogMessage * ) message
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
   CNLogMessage * msg;
    
    msg = [ [ CNLogMessage alloc ] initWithMessage: message ];
    
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
    CNLogMessage * msg;
    
    if( enableDebug == YES ) {
        
        msg      = [ [ CNLogMessage alloc ] initWithMessage: message ];
        msg.type = CNMessageDebug;
        
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
