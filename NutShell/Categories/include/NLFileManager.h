/*******************************************************************************
 * Copyright (c) 2011, Jean-David Gadina <macmade@eosgarden.com>
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

/* $Id: NLFileManager.h 245 2010-05-30 14:18:05Z  $ */

/*!
 * @header
 * 
 * @discussion  This file should not be included directly by application source
 *              files using the NutShell framework. Including 'NutShell.h' is
 *              preferred over importing individual files because it will use a
 *              precompiled version.
 */

/*!
 * @abstract    NSFileManager additions
 * 
 * @version     1.0
 * @namespace   NutShell
 */
@interface NSFileManager( NLFileManager )

/*!
 * @abstract    Gets the flags of a given file or directory
 * 
 * @param       path    The path of a file o rdirectory
 * @param       error   If an error occurs, upon return contains an NSError object that describes the problem. Pass NULL if you do not want error information
 * @return      An NSDictionary object that describes the flags of the file specified by path
 */
- ( NSDictionary * )flagsOfItemAtPath: ( NSString * )path error: ( NSError ** )error;

/*!
 * @abstract    Sets the flags of a given file or directory
 * 
 * @discussion  As in the POSIX standard,the application either must own the
 *              file or directory or must be running as superuser for flag
 *              changes to take effect.
 * 
 * @param       flags   A dictionary containing as keys the flags to set for path and as values the corresponding value for the flag
 * @param       path    The path of a file o rdirectory
 * @param       error   If an error occurs, upon return contains an NSError object that describes the problem. Pass NULL if you do not want error information
 * @return      YES if the flags were successfully changed, otherwise NO
 */
- ( BOOL )setFlags: ( NSDictionary * )flags ofItemAtPath: ( NSString * )path error: ( NSError ** )error;

@end

#pragma mark -
#pragma mark File flags keys

FOUNDATION_EXPORT NSString * const NLFileFlagArchived;
FOUNDATION_EXPORT NSString * const NLFileFlagHidden;
FOUNDATION_EXPORT NSString * const NLFileFlagNoDump;
FOUNDATION_EXPORT NSString * const NLFileFlagOpaque;
FOUNDATION_EXPORT NSString * const NLFileFlagSystemAppendOnly;
FOUNDATION_EXPORT NSString * const NLFileFlagSystemImmutable;
FOUNDATION_EXPORT NSString * const NLFileFlagUserAppendOnly;
FOUNDATION_EXPORT NSString * const NLFileFlagUserImmutable;
