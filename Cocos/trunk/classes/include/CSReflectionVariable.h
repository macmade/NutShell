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
#import "CSObject.h"

/*!
 * @abstract    Objective-C class instance variable reflector
 * 
 * @version     1.0
 * @namespace   Cocos
 */
@interface CSReflectionVariable: CSObject
{
@protected
    
    /*!
     * 
     */
    Ivar variable;
    
    /*!
     * 
     */
    NSString * name;
    
    /*!
     * 
     */
    NSString * typeEncoding;
    
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
@property( readonly ) Ivar variable;

/*! @property */
@property( readonly ) NSString * name;

/*! @property */
@property( readonly ) NSString * typeEncoding;

/*!
 * 
 */
+ ( id )reflectorFromVariable:( Ivar )var;

/*!
 * 
 */
- ( id )initWithVariable:( Ivar )var;

@end
