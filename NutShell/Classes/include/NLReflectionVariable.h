/*******************************************************************************
 * NutShell Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

/* $Id: NLReflectionVariable.h 245 2010-05-30 14:18:05Z  $ */

/*!
 * @header
 * 
 * @discussion  This file should not be included directly by application source
 *              files using the NutShell framework. Including 'NutShell.h' is
 *              preferred over importing individual files because it will use a
 *              precompiled version.
 */

// System includes
#import <objc/runtime.h>

// Local includes
#import "NLObject.h"

/*!
 * @abstract    Objective-C class instance variable reflector
 * 
 * @version     1.0
 * @namespace   NutShell
 */
@interface NLReflectionVariable: NLObject
{
@protected
    
    /*!
     * @abstract    The Objective-C instance variable
     */
    Ivar variable;
    
    /*!
     * @abstract    The name of the instance variable
     */
    NSString * name;
    
    /*!
     * @abstract    The type encoding of the instance variable
     */
    NSString * typeEncoding;
    
    /*!
     * @abstract    The offset of the instance variable
     */
    ptrdiff_t offset;
    
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
@property( readonly ) Ivar variable;

/*! @property */
@property( readonly ) NSString * name;

/*! @property */
@property( readonly ) NSString * typeEncoding;

/*! @property */
@property( readonly ) ptrdiff_t offset;

/*!
 * @abstract    Creates a new reflector with an instance variable
 * 
 * @param       var     The instance variable
 * @return      The instance of the reflector object
 */
+ ( id )reflectorFromVariable:( Ivar )var;

/*!
 * @abstract    Initializes a newly allocated reflector with an instance variable
 * 
 * @param       var     The instance variable
 * @return      The instance of the reflector object
 */
- ( id )initWithVariable:( Ivar )var;

@end
