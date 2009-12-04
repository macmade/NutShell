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
 * @abstract    NSString additions
 * 
 * @version     1.0
 * @namespace   Cocos
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
