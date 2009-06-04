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
#import "CNObject.h"

/*!
 * @abstract    Event object
 * 
 * @version     1.0
 * @namespace   CocoNuts
 */
@interface CNEvent: CNObject
{
@protected
    
    /*!
     * @abstract    Whether the event is propagating
     */
    BOOL propagating;
    
    /*!
     * @abstract    The event's target object
     */
    id target;
    
    /*!
     * @abstract    The event's name
     */
    NSString * name;
    
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
@property( assign, readwrite, getter=isPropagating ) BOOL propagating;

/*! @property */
@property( readonly ) id target;

/*! @property */
@property( readonly ) NSString *  name;

/*!
 * @abstract    Initializes a newly allocated event with a specific name
 * 
 * @param       eventName   The event's name
 * @return      The instance of the event object
 */
- ( id )initWithName: ( NSString * )eventName;

/*!
 * @abstract    Initializes a newly allocated event with a target object
 * 
 * @param       targetObject    The target object
 * @return      The instance of the event object
 */
- ( id )initWithTarget: ( id )targetObject;

/*!
 * @abstract    Initializes a newly allocated event with a specific name and a target object
 * 
 * @param       eventName       The event's name
 * @param       targetObject    The target object
 * @return      The instance of the event object
 */
- ( id )initWithName: ( NSString * )eventName target: ( id )targetObject;

@end
