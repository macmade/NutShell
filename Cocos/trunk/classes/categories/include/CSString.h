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

/*!
 * @abstract    NSString additions
 * 
 * @version     1.0
 * @namespace   Cocos
 */
@interface NSString( CSString )

/*!
 * @abstract    
 * 
 " @return      
 */
- ( NSNumber * )crc32;

/*! @property */
@property( readonly ) NSNumber * crc32;

@end