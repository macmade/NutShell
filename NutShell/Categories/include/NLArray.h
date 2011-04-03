/*******************************************************************************
 * NutShell Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

/* $Id: NLColor.h 728 2009-08-15 13:35:58Z  $ */

/*!
 * @header
 * 
 * @discussion  This file should not be included directly by application source
 *              files using the NutShell framework. Including 'NutShell.h' is
 *              preferred over importing individual files because it will use a
 *              precompiled version.
 */

/*!
 * @abstract    NSArray additions
 * 
 * @version     1.0
 * @namespace   NutShell
 */
@interface NSArray( NLArray )

/*!
 * @abstract    
 */
+ ( NSArray * )arrayByFilteringArray: ( NSArray * )source withCallback: ( BOOL ( ^ )( id ) )callback;

@end
