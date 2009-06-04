/*******************************************************************************
 * CocoNuts Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 * 
 * This file should not be included directly by application source files using
 * the CocoNuts framework. Including 'CocoNuts.h' is preferred over importing
 * individual files because it will use a precompiled version.
 ******************************************************************************/

// $Id$

// Local includes
#import "CNObject.h"

/**
 * Objective-C class method reflector
 * 
 * @author      Jean-David Gadina <macmade@eosgarden.com>
 * @version     1.0
 */
@interface CNReflectionMethod: CNObject
{
@private
    
    /**
     * Reserved instance variables to help ensure binary compatibility with
     * future versions of the class
     */
    id _r1;
    id _r2;
}

@end
