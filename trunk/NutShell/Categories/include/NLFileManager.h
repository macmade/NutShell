/*******************************************************************************
 * NutShell Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
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
