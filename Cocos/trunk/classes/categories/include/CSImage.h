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
 * @abstract    NSImage additions
 * 
 * @version     1.0
 * @namespace   Cocos
 */
@interface NSImage( CSImage )

/*!
 * @abstract    
 * 
 * @param       
 * @return      
 */
+ ( NSImage * )quickLookPreviewFromFile:( NSString * )path size:( NSSize )size;

@end
