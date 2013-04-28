/*******************************************************************************
 * Copyright (c) 2011, Jean-David Gadina - www.xs-labs.com
 * Distributed under the Boost Software License, Version 1.0.
 * 
 * Boost Software License - Version 1.0 - August 17th, 2003
 * 
 * Permission is hereby granted, free of charge, to any person or organization
 * obtaining a copy of the software and accompanying documentation covered by
 * this license (the "Software") to use, reproduce, display, distribute,
 * execute, and transmit the Software, and to prepare derivative works of the
 * Software, and to permit third-parties to whom the Software is furnished to
 * do so, all subject to the following:
 * 
 * The copyright notices in the Software and this entire statement, including
 * the above license grant, this restriction and the following disclaimer,
 * must be included in all copies of the Software, in whole or in part, and
 * all derivative works of the Software, unless such copies or derivative
 * works are solely in the form of machine-executable object code generated by
 * a source language processor.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
 * SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
 * FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
 * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 ******************************************************************************/

/* $Id: NLTextView.h 245 2010-05-30 14:18:05Z  $ */

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
