/*******************************************************************************
 * Copyright (c) 2011, Jean-David Gadina <macmade@eosgarden.com>
 * Distributed under the Boost Software License, Version 1.0.
 * 
 * Boost Software License - Version 1.0 - August 17th, 2003
 * 
 * Permission is hereby granted, free of charge, to any person or organization
 * obtaining a copy of the software and accompanying documentation covered by
 * this license (the "Software") to use, reproduce, display, distribute,
 * execute, and transmit the Software, and to prepare derivative works of the
 * Software, and to permit third-parties to whom the Software is furnished to
 * do so, all subject to the following:
 * 
 * The copyright notices in the Software and this entire statement, including
 * the above license grant, this restriction and the following disclaimer,
 * must be included in all copies of the Software, in whole or in part, and
 * all derivative works of the Software, unless such copies or derivative
 * works are solely in the form of machine-executable object code generated by
 * a source language processor.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
 * SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
 * FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
 * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 ******************************************************************************/

/* $Id: NLReflectionClass.h 245 2010-05-30 14:18:05Z  $ */

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
@class NLReflectionMethod, NLReflectionProtocol;

/*!
 * @abstract    Objective-C class reflector
 * 
 * @version     1.0
 * @namespace   NutShell
 */
@interface NLReflectionClass: NLObject
{
@protected
    
    /*!
     * @abstract    
     */
    Class objcClass;
    
    /*!
     * @abstract    
     */
    NSString * name;
    
    /*!
     * @abstract    
     */
    NLReflectionClass * superClass;
    
    /*!
     * @abstract    
     */
    BOOL metaClass;
    
    /*!
     * @abstract    
     */
    NSNumber * instanceSize;
    
    /*!
     * @abstract    
     */
    NSNumber * version;
    
    /*!
     * @abstract    
     */
    NSDictionary * instanceVariables;
    
    /*!
     * @abstract    
     */
    NSString * instanceVariableLayout;
    
    /*!
     * @abstract    
     */
    NSString * weakInstanceVariableLayout;
    
    /*!
     * @abstract    
     */
    NSDictionary * properties;
    
    /*!
     * @abstract    
     */
    NSDictionary * instanceMethods;
    
    /*!
     * @abstract    
     */
    NSDictionary * protocols;
    
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
@property( readonly ) Class objcClass;

/*! @property */
@property( readonly ) NSString * name;

/*! @property */
@property( readonly ) NLReflectionClass * superClass;

/*! @property */
@property( readonly, getter=isMetaClass ) BOOL metaClass;

/*! @property */
@property( readonly ) NSNumber * instanceSize;

/*! @property */
@property( readonly ) NSNumber * version;

/*! @property */
@property( readonly ) NSDictionary * instanceVariables;

/*! @property */
@property( readonly ) NSString * instanceVariableLayout;

/*! @property */
@property( readonly ) NSString * weakInstanceVariableLayout;

/*! @property */
@property( readonly ) NSDictionary * properties;

/*! @property */
@property( readonly ) NSDictionary * instanceMethods;

/*! @property */
@property( readonly ) NSDictionary * protocols;

/*!
 * @abstract    
 */
+ ( id )reflectorFromClass: ( Class )objectivecClass;

/*!
 * @abstract    
 */
+ ( id )reflectorFromClassname: ( NSString * )classname;

/*!
 * @abstract    
 */
+ ( id )reflectorFromObject: ( id )object;

/*!
 * @abstract    
 */
- ( id )initWithClass: ( Class )objectivecClass;

/*!
 * @abstract    
 */
- ( id )initWithClassname: ( NSString * )classname;

/*!
 * @abstract    
 */
- ( id )initWithObject: ( id )object;

/*!
 * @abstract    
 */
- ( BOOL )respondsToSelector: ( SEL )selector;

/*!
 * @abstract    
 */
- ( BOOL )respondsToMethodReflector: ( NLReflectionMethod * )reflector;

/*!
 * @abstract    
 */
- ( BOOL )conformsToProtocol: ( Protocol * )protocol;

/*!
 * @abstract    
 */
- ( BOOL )conformsToProtocolReflector: ( NLReflectionProtocol * )reflector;

/*!
 * @abstract    
 */
- ( id )createInstance: ( size_t )extraBytes;

@end
