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
 * @abstract    Objective-C protocol reflector
 * 
 * @version     1.0
 * @namespace   Cocos
 */
@interface CSReflectionProtocol: CSObject
{
@protected
    
    Protocol * protocol;
    NSString * name;
    NSDictionary * properties;
    
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
@property( readonly ) Protocol * protocol;

/*! @property */
@property( readonly ) NSString * name;

/*! @property */
@property( readonly ) NSDictionary * properties;

+ ( id )reflectorFromProtocol:( Protocol * )proto;
- ( id )initWithProtocol:( Protocol * )proto;

@end
