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
 * @abstract    NSFileManager additions
 * 
 * @version     1.0
 * @namespace   Cocos
 */
@interface NSFileManager( CSFileManager )

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

FOUNDATION_EXPORT NSString * const CSFileFlagArchived;
FOUNDATION_EXPORT NSString * const CSFileFlagHidden;
FOUNDATION_EXPORT NSString * const CSFileFlagNoDump;
FOUNDATION_EXPORT NSString * const CSFileFlagOpaque;
FOUNDATION_EXPORT NSString * const CSFileFlagSystemAppendOnly;
FOUNDATION_EXPORT NSString * const CSFileFlagSystemImmutable;
FOUNDATION_EXPORT NSString * const CSFileFlagUserAppendOnly;
FOUNDATION_EXPORT NSString * const CSFileFlagUserImmutable;
