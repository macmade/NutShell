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

// Used classes
@class CSLogger, CSExecution;

/*!
 * @abstract    Application base
 * 
 * @version     1.0
 * @namespace   Cocos
 */
@interface CSApplication: NSApplication
{
@protected
    
    /*!
     * @abstract    The execution object
     */
    CSExecution * execution;
    
    /*!
     * @abstract    The shared workspace
     */
    NSWorkspace * workspace;
    
    /*!
     * @abstract    The logger object
     */
    CSLogger * logger;
    
@private
    
    /*!
     * @abstract    Reserved 1
     * 
     * @discussion  Reserved instance variables to help ensure binary
     *              compatibility with future versions of the class.
     */
    id CS_r1;
    
    /*!
     * @abstract    Reserved 2
     * 
     * @discussion  Reserved instance variables to help ensure binary
     *              compatibility with future versions of the class.
     */
    id CS_r2;
}

/*! @property */
@property( readonly ) CSExecution * execution;

/*! @property */
@property( readonly ) NSWorkspace * workspace;

/*! @property */
@property( readonly ) CSLogger * logger;

@end
