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
 * @abstract    NSTextView additions
 * 
 * @version     1.0
 * @namespace   Cocos
 */
@interface NSTextView( CSTextView )

/*!
 * @abstract    Displays the content of a file in the textview object
 * 
 * @param       path    The path to the file
 * @return      void
 */
- ( void )displayContentOfFile: ( NSString * )filePath;

/*!
 * @abstract    Sets the font and size of the textview object
 * 
 * @param       fontName    The name of the font
 * @param       fontSize    The size of the font
 * @return      void
 */
- ( void )setFontWithNameAndSize: ( NSString * )fontName size: ( int )fontSize;

@end
