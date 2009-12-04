/*******************************************************************************
 * Cocos Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

/*!
 * @header
 * 
 * @discussion  This file should not be included directly by application source
 *              files using the Cocos framework. Including 'Cocos.h' is
 *              preferred over importing individual files because it will use a
 *              precompiled version.
 */

// System includes
#import <objc/runtime.h>

// Local includes
#import "NLObject.h"

/*!
 * @abstract    Objective-C class property reflector
 * 
 * @version     1.0
 * @namespace   Cocos
 */
@interface NLReflectionProperty: NLObject
{
@protected
    
    /*!
     * @abstract    The Objective-C property
     */
    objc_property_t property;
    
    /*!
     * @abstract    The name of the property
     */
    NSString * name;
    
    /*!
     * @abstract    The attributes of the property
     */
    NSString * attributes;
    
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
@property( readonly ) objc_property_t property;

/*! @property */
@property( readonly ) NSString * name;

/*! @property */
@property( readonly ) NSString * attributes;

/*!
 * @abstract    
 */
+ ( id )reflectorFromProperty:( objc_property_t )prop;

/*!
 * @abstract    
 */
- ( id )initWithProperty:( objc_property_t )prop;

@end
