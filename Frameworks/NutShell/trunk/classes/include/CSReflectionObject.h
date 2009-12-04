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

// Local includes
#import "CSObject.h"

// Used classes
@class CSReflectionClass;

/*!
 * @abstract    Objective-C class instance object reflector
 * 
 * @version     1.0
 * @namespace   Cocos
 */
@interface CSReflectionObject: CSObject
{
@protected
    
    /*!
     * @abstract    The reflector for the object's class
     */
    CSReflectionClass * classReflector;
    
    /*!
     * @abstract    The name of the object's class
     */
    NSString * classname;
    
@private
    
    /*!
     * @abstract    Reserved 1
     * 
     * @discussion  Reserved instance variables to help ensure binary
     *              compatibility with future versions of the class.
     */
    id CS_r1;
    
    /*!
     * @abstract    Reserved 2
     * 
     * @discussion  Reserved instance variables to help ensure binary
     *              compatibility with future versions of the class.
     */
    id CS_r2;
}

/*! @property */
@property( readonly ) CSReflectionClass * classReflector;

/*! @property */
@property( readonly ) NSString * classname;

/*!
 * @abstract    Creates a new reflector with an object
 * 
 * @param       object  The class instance object
 * @return      The instance of the reflector object
 */
+ ( id )reflectorFromObject:( id )object;

/*!
 * @abstract    Initializes a newly allocated reflector with an object
 * 
 * @param       object  The class instance object
 * @return      The instance of the reflector object
 */
- ( id )initWithObject:( id )object;

@end
