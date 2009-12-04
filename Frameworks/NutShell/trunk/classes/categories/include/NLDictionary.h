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
 * @abstract    NSDictionary additions
 * 
 * @version     1.0
 * @namespace   Cocos
 */
@interface NSDictionary( NLDictionary )

/*!
 * @abstract    
 */
+ ( NSDictionary * )dictionaryByFilteringDictionary: ( NSDictionary * )source withCallback: ( BOOL ( ^ )( id ) )callback;

/*!
 * @abstract    Checks whether a key exists in the dictionary
 * 
 * @param       key     The key to check for
 * @return      A boolean value indicating if the key exists in the dictionary
 */
- ( BOOL )hasKey: ( NSString * )key;

@end
