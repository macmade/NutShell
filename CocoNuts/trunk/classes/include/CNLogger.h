/*******************************************************************************
 * CocoNuts Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

/*!
 * @header
 * 
 * @discussion  This file should not be included directly by application source
 *              files using the CocoNuts framework. Including 'CocoNuts.h' is
 *              preferred over importing individual files because it will use a
 *              precompiled version.
 */

// Local includes
#import "CNObjectSingleton.h"

// Used classes
@class CNLogMessage;

/*!
 * @abstract    Logger object
 * 
 * @version     1.0
 * @namespace   CocoNuts
 */
@interface CNLogger: CNObjectSingleton
{
@protected
    
    /*!
     * @abstract    An array with the messages
     */
    NSMutableArray * messages;
    
    /*!
     * @abstract    Whether the debug messages are enables
     */
    BOOL debug;
    
@private
    
    /*!
     * @abstract    Reserved 1
     * 
     * @discussion  Reserved instance variables to help ensure binary
     *              compatibility with future versions of the class.
     */
    id CN_r1;
    
    /*!
     * @abstract    Reserved 2
     * 
     * @discussion  Reserved instance variables to help ensure binary
     *              compatibility with future versions of the class.
     */
    id CN_r2;
}

/*! @property */
@property( readonly ) NSMutableArray * messages;

/*! @property */
@property( assign, readwrite, getter=debugIsEnabled, setter=enableDebug: ) BOOL debug;

/*!
 * @abstract    Adds a message
 * 
 * @param       message The message to add
 * @return      void
 */
- ( void )message: ( CNLogMessage * ) message;

/*!
 * @abstract    Adds a log message
 * 
 * @param       message The log message
 * @return      void
 */
- ( void )log: ( NSString * )message;

/*!
 * @abstract    Adds a debug message
 * 
 * @param       message The debug message
 * @return      void
 */
- ( void )debug: ( NSString * )message;

/*!
 * @abstract    Clears the log messages
 * 
 * @return      void
 */
- ( void )clear;

@end
