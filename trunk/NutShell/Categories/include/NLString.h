/*******************************************************************************
 * NutShell Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

/* $Id: NLString.h 245 2010-05-30 14:18:05Z  $ */

/*!
 * @header
 * 
 * @discussion  This file should not be included directly by application source
 *              files using the NutShell framework. Including 'NutShell.h' is
 *              preferred over importing individual files because it will use a
 *              precompiled version.
 */

/*!
 * @abstract    NSString additions
 * 
 * @version     1.0
 * @namespace   NutShell
 */
@interface NSString( NLString )

/*!
 * @abstract    
 * 
 " @return      
 */
- ( NSNumber * )crc32;

/*! @property */
@property( readonly ) NSNumber * crc32;

/*!
 * @abstract    
 */
- ( BOOL )regexMatch: ( NSString * )expression;

/*!
 * @abstract    
 */
- ( BOOL )regexMatch: ( NSString * )expression flags: ( int )flags;

/*!
 * @abstract    
 */
- ( BOOL )regexMatch: ( NSString * )expression matches: ( NSMutableArray * )matches;

/*!
 * @abstract    
 */
- ( BOOL )regexMatch: ( NSString * )expression matches: ( NSMutableArray * )matches flags: ( int )flags;

/*!
 * @abstract    
 */
- ( NSString * )regexReplace: ( NSString * )expression withString: ( NSString * )replace;

/*!
 * @abstract    
 */
- ( NSString * )regexReplace: ( NSString * )expression withString: ( NSString * )replace flags: ( int )flags;

@end
