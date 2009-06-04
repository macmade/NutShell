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

/*!
 * @abstract    Objective-C class reflector
 * 
 * @version     1.0
 * @namespace   Cocos
 */
@interface CSReflectionClass: CSObject
{
@protected
    
    Class objcClass;
    NSString * name;
    CSReflectionClass * superClass;
    BOOL metaClass;
    NSNumber * instanceSize;
    NSDictionary * instanceVariables;
    NSDictionary * properties;
    NSDictionary * instanceMethods;
    NSDictionary * protocols;
    
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
@property( readonly ) Class objcClass;

/*! @property */
@property( readonly ) NSString * name;

/*! @property */
@property( readonly ) CSReflectionClass * superClass;

/*! @property */
@property( readonly, getter=isMetaClass ) BOOL metaClass;

/*! @property */
@property( readonly ) NSNumber * instanceSize;

/*! @property */
@property( readonly ) NSDictionary * instanceVariables;

/*! @property */
@property( readonly ) NSDictionary * properties;

/*! @property */
@property( readonly ) NSDictionary * instanceMethods;

/*! @property */
@property( readonly ) NSDictionary * protocols;

+ ( id )reflectorFromClass: ( Class )objectivecClass;
+ ( id )reflectorFromClassname: ( NSString * )classname;
+ ( id )reflectorFromObject: ( id )object;
- ( id )initWithClass: ( Class )objectivecClass;
- ( id )initWithClassname: ( NSString * )classname;
- ( id )initWithObject: ( id )object;

@end