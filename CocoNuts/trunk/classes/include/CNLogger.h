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

// Local includes
#import "CNObjectSingleton.h"

// Used classes
@class CNLogMessage;

/**
 * Logger
 *
 * @author      Jean-David Gadina <macmade@eosgarden.com>
 * @version     1.0
 */
@interface CNLogger: CNObjectSingleton
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
    
@private
    
    /**
     * Reserved instance variables to help ensure binary compatibility with
     * future versions of the class
     */
    id _r1;
    id _r2;
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
- ( void )message: ( CNLogMessage * ) message;

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
