/*******************************************************************************
 * CocoNuts Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

/*!
 * @header
 * 
 * @discussion  This file should not be included directly by application source
 *              files using the CocoNuts framework. Including 'CocoNuts.h' is
 *              preferred over importing individual files because it will use a
 *              precompiled version.
 */

// Local includes
#import "CNSingleton.h"
#import "CNObject.h"

/*!
 * @abstract    Base class for the singleton objects
 * 
 * @version     1.0
 * @namespace   CocoNuts
 */
@interface CNObjectSingleton: CNObject < CNSingleton >
{}

/*!
 * @abstract    Gets the unique (singleton) instance of the class
 * 
 * @return      The unique instance of the class
 */
+ ( id )getInstance;

@end
