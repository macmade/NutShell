/*******************************************************************************
 * NutShell Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

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

// Used classes
@class NLReflectionClass;

/*!
 * @abstract    Objective-C class instance object reflector
 * 
 * @version     1.0
 * @namespace   NutShell
 */
@interface NLReflectionObject: NLObject
{
@protected
    
    /*!
     * @abstract    The reflector for the object's class
     */
    NLReflectionClass * classReflector;
    
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
@property( readonly ) NLReflectionClass * classReflector;

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
