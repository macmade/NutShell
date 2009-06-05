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
 * @abstract    Keychain item helper
 * 
 * @version     1.0
 * @namespace   Cocos
 */
@interface CSKeychainItem: CSObject
{
@protected
    
    /*!
     * Whether the item exists in the keychain
     */
    BOOL itemExists;
    
    /*!
     * The item's name
     */
    NSString * name;
    
    /*!
     * The item's kind
     */
    NSString * kind;
    
    /*!
     * The item's password
     */
    NSString * password;
    
    /*!
     * The username
     */
    NSString * username;
    
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
@property( readonly ) BOOL itemExists;

/*! @property */
@property( readonly ) NSString * name;

/*! @property */
@property( readonly ) NSString * kind;

/*! @property */
@property( readonly ) NSString * password;

/*! @property */
@property( readonly ) NSString * username;

/*!
 * @abstract    
 */
+ ( id )createWithName: ( NSString * )itemName;

/*!
 * @abstract    
 */
+ ( id )createWithName: ( NSString * )itemName kind: ( NSString * )itemKind;

/*!
 * @abstract    
 */
+ ( id )createWithName: ( NSString * )itemName kind: ( NSString * )itemKind username: ( NSString * )itemUser;

/*!
 * @abstract    
 */
- ( id )initWithName: ( NSString * )itemName;

/*!
 * @abstract    
 */
- ( id )initWithName: ( NSString * )itemName kind: ( NSString * )itemKind;

/*!
 * @abstract    
 */
- ( id )initWithName: ( NSString * )itemName kind: ( NSString * )itemKind username: ( NSString * )itemUser;

/*!
 * @abstract    
 */
- ( BOOL )create;

/*!
 * @abstract    
 */
- ( BOOL )modify: ( NSString * )newPassword;

/*!
 * @abstract    
 */
- ( BOOL )remove;

@end
