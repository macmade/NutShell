/*******************************************************************************
 * NutShell Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

/* $Id: NLLogMessage.h 245 2010-05-30 14:18:05Z  $ */

/*!
 * @header
 * 
 * @discussion  This file should not be included directly by application source
 *              files using the NutShell framework. Including 'NutShell.h' is
 *              preferred over importing individual files because it will use a
 *              precompiled version.
 */

// Local includes
#import "NLObject.h"

/*!
 * @enum        MessageTypes
 * 
 * @abstract    The types of the log messages
 */
enum
{
    NLMessageLog   = 0,
    NLMessageDebug = 1
};

/*!
 * @abstract    Log message object
 * 
 * @version     1.0
 * @namespace   NutShell
 */
@interface NLLogMessage: NLObject
{
@protected
    
    /*!
     * @abstract    The message
     */
    NSString * message;
    
    /*!
     * @abstract    The message's date
     */
    NSDate * date;
    
    /*!
     * @abstract    The message's type
     */
    int type;
    
@private
    
    /*!
     * @abstract    Reserved 1
     * 
     * @discussion  Reserved instance variables to help ensure binary
     *              compatibility with future versions of the class.
     */
    id NL_r1;
    
    /*!
     * @abstract    Reserved 2
     * 
     * @discussion  Reserved instance variables to help ensure binary
     *              compatibility with future versions of the class.
     */
    id NL_r2;
}

/*! @property */
@property( copy, readwrite ) NSString * message;

/*! @property */
@property( copy, readwrite ) NSDate * date;

/*! @property */
@property( assign, readwrite ) int type;

/*!
 * @abstract    Creates a new log message with a specific message text
 * 
 * @param       str         The message text
 * @return      The instance of the message object
 */
+ ( id )messageWithMessage: ( NSString * )str;

/*!
 * @abstract    Creates a new log message with a specific message text and date
 * 
 * @param       str         The message text
 * @param       time        The message date
 * @return      The instance of the message object
 */
+ ( id )messageWithMessage: ( NSString * )str date: ( NSDate * )messageTime;

/*!
 * @abstract    Creates a new log message with a specific message text, date and type
 * 
 * @param       str         The message text
 * @param       time        The message date
 * @param       messageType The message type
 * @return      The instance of the message object
 */
+ ( id )messageWithMessage: ( NSString * )str date: ( NSDate * )messageTime type: ( int )messageType;

/*!
 * @abstract    Initializes a newly allocated log message with a specific message text
 * 
 * @param       str         The message text
 * @return      The instance of the message object
 */
- ( id )initWithMessage: ( NSString * )str;

/*!
 * @abstract    Initializes a newly allocated log message with a specific message text and date
 * 
 * @param       str         The message text
 * @param       time        The message date
 * @return      The instance of the message object
 */
- ( id )initWithMessage: ( NSString * )str date: ( NSDate * )messageTime;

/*!
 * @abstract    Initializes a newly allocated log message with a specific message text, date and type
 * 
 * @param       str         The message text
 * @param       time        The message date
 * @param       messageType The message type
 * @return      The instance of the message object
 */
- ( id )initWithMessage: ( NSString * )str date: ( NSDate * )messageTime type: ( int )messageType;

@end