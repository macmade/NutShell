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
 * @abstract    User preferences object
 * 
 * @version     1.0
 * @namespace   CocoNuts
 */
@interface CNPreferences: CNObject
{
@protected
    
    /*!
     * @abstract    The preferences default values
     */
    NSMutableDictionary * defaults;
    
    /*!
     * @abstract    The preferences values
     */
    NSUserDefaults * values;
    
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
@property( readonly ) NSMutableDictionary * defaults;

/*! @property */
@property( readonly ) NSUserDefaults * values;

/*!
 * @abstract    Initializes a newly allocated event with a property list file
 * 
 * @param       filename   The name to the property list file
 * @return      The instance of the event object
 */
- ( id )initWithPropertyList: ( NSString * )filename;

@end
