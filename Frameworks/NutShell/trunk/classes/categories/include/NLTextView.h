/*******************************************************************************
 * NutShell Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

/*!
 * @header
 * 
 * @discussion  This file should not be included directly by application source
 *              files using the NutShell framework. Including 'NutShell.h' is
 *              preferred over importing individual files because it will use a
 *              precompiled version.
 */

/*!
 * @abstract    NSTextView additions
 * 
 * @version     1.0
 * @namespace   NutShell
 */
@interface NSTextView( NLTextView )

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

/*!
 * @abstract    Disables the use of soft wrapping in the textview object
 * 
 * @return      void
 */
- ( void )disablesSoftWrapping;

/*!
 * @abstract    Appends a string at the end of the text view contents
 * 
 * @param       string  The string to append
 * @return      void
 */
- ( void )appendStringAtEnd: ( NSString * )str;

/*!
 * @abstract    Places the insertion point at the beginning of the text view contents
 * 
 * @return      void
 */
- ( void )moveInsertionPointAtStart;

/*!
 * @abstract    Places the insertion point at the end of the text view contents
 * 
 * @return      void
 */
- ( void )moveInsertionPointAtEnd;

/*!
 * @abstract    Scrolls to the beginning of the text view
 * 
 * @return      void
 */
- ( void )scrollToTop;

/*!
 * @abstract    Scrolls to the end of the text view
 * 
 * @return      void
 */
- ( void )scrollToBottom;

@end
