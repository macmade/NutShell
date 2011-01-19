/*******************************************************************************
 * NutShell Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

/* $Id: NLReflectionMethod.h 245 2010-05-30 14:18:05Z  $ */

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
 * @abstract    Objective-C class method reflector
 * 
 * @version     1.0
 * @namespace   NutShell
 */
@interface NLReflectionMethod: NLObject
{
@protected
    
    /*!
     * @abstract
     */
    Method method;
    
    /*!
     * @abstract
     */
    SEL selector;
    
    /*!
     * @abstract    
     */
    NSString * name;
    
    /*!
     * @abstract    
     */
    IMP implementation;
    
    /*!
     * @abstract    
     */
    NSString * typeEncoding;
    
    /*!
     * @abstract    
     */
    NSString * returnType;
    
    /*!
     * @abstract    
     */
    NSNumber * numberOfArguments;
    
    /*!
     * @abstract    
     */
    NSArray * arguments;
    
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
@property( readonly ) Method method;

/*! @property */
@property( readonly ) SEL selector;

/*! @property */
@property( readonly ) NSString * name;

/*! @property */
@property( readonly ) IMP implementation;

/*! @property */
@property( readonly ) NSString * typeEncoding;

/*! @property */
@property( readonly ) NSString * returnType;

/*! @property */
@property( readonly ) NSNumber * numberOfArguments;

/*! @property */
@property( readonly ) NSArray * arguments;

/*!
 * @abstract    
 */
+ ( id )reflectorFromMethod:( Method )objcMethod;

/*!
 * @abstract    
 */
- ( id )initWithMethod:( Method )objcMethod;

/*!
 * @abstract    
 */
- ( BOOL )isEqual:( SEL )sel;

/*!
 * @abstract    
 */
- ( BOOL )isEqualToReflector:( NLReflectionMethod * )methodRef;

@end
