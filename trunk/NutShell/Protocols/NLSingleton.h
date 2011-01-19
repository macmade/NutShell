/*******************************************************************************
 * NutShell Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

/* $Id: NLSingleton.h 245 2010-05-30 14:18:05Z  $ */

/*!
 * @header
 * 
 * @discussion  This file should not be included directly by application source
 *              files using the NutShell framework. Including 'NutShell.h' is
 *              preferred over importing individual files because it will use a
 *              precompiled version.
 */

/*!
 * @abstract    Protocol for the singleton classes
 * 
 * @version     1.0
 * @namespace   NutShell
 */
@protocol NLSingleton

/*!
 * @abstract    Gets the unique (singleton) instance of the class
 * 
 * @return      The unique instance of the class
 */
+ ( id )getInstance;

@end
