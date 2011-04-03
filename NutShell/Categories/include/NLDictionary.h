/*******************************************************************************
 * NutShell Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

/* $Id: NLDictionary.h 245 2010-05-30 14:18:05Z  $ */

/*!
 * @header
 * 
 * @discussion  This file should not be included directly by application source
 *              files using the NutShell framework. Including 'NutShell.h' is
 *              preferred over importing individual files because it will use a
 *              precompiled version.
 */

/*!
 * @abstract    NSDictionary additions
 * 
 * @version     1.0
 * @namespace   NutShell
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
