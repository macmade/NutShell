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
#import "NLObject.h"

/*!
 * @abstract    Keychain item helper
 * 
 * @version     1.0
 * @namespace   Cocos
 */
@interface NLKeychainItem: NLObject
{
@protected
    
    /*!
     * The keychain item
     */
    SecKeychainItemRef item;
     
    /*!
     * Whether the item exists in the keychain
     */
    BOOL itemExists;
    
    /*!
     * The item's name
     */
    NSString * name;
    
    /*!
     * The username
     */
    NSString * username;
    
    /*!
     * The item's password
     */
    NSString * password;
    
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
@property( readonly ) BOOL itemExists;

/*! @property */
@property( readonly ) NSString * name;

/*! @property */
@property( readonly ) NSString * username;

/*! @property */
@property( copy, readwrite ) NSString * password;

/*!
 * @abstract    
 */
+ ( id )createWithName: ( NSString * )itemName username: ( NSString * )itemUser;

/*!
 * @abstract    
 */
- ( id )initWithName: ( NSString * )itemName username: ( NSString * )itemUser;

/*!
 * @abstract    
 */
- ( BOOL )create;

/*!
 * @abstract    
 */
- ( BOOL )modify;

/*!
 * @abstract    
 */
- ( BOOL )remove;

/*!
 * @abstract    
 */
- ( void )update;

@end
