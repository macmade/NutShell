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
#import "CNObject.h"

/**
 * Types of the log messages
 */
enum {
    CNMessageLog   = 0,
    CNMessageDebug = 1
};

/**
 * Log message object
 *
 * @author      Jean-David Gadina <macmade@eosgarden.com>
 * @version     1.0
 */
@interface CNLogMessage: CNObject
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
