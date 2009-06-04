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

// Used classes
@class CNLogger, CNExecution;

/*!
 * @abstract    Application base
 * 
 * @version     1.0
 * @namespace   CocoNuts
 */
@interface CNApplication: NSApplication
{
@protected
    
    /*!
     * @abstract    The execution object
     */
    CNExecution * execution;
    
    /*!
     * @abstract    The shared workspace
     */
    NSWorkspace * workspace;
    
    /*!
     * @abstract    The logger object
     */
    CNLogger * logger;
    
@private
    
    /*!
     * @abstract    Reserved 1
     * 
     * @discussion  Reserved instance variables to help ensure binary
     *              compatibility with future versions of the class.
     */
    id CN_r1;
    
    /*!
     * @abstract    Reserved 2
     * 
     * @discussion  Reserved instance variables to help ensure binary
     *              compatibility with future versions of the class.
     */
    id CN_r2;
}

/*! @property */
@property( readonly ) CNExecution * execution;

/*! @property */
@property( readonly ) NSWorkspace * workspace;

/*! @property */
@property( readonly ) CNLogger * logger;

@end
