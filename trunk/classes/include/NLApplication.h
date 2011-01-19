/*******************************************************************************
 * NutShell Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

/*!
 * @header
 * 
 * @discussion  This file should not be included directly by application source
 *              files using the NutShell framework. Including 'NutShell.h' is
 *              preferred over importing individual files because it will use a
 *              precompiled version.
 */

// Used classes
@class NLLogger, NLExecution;

/*!
 * @abstract    Application base
 * 
 * @version     1.0
 * @namespace   NutShell
 */
@interface NLApplication: NSApplication
{
@protected
    
    /*!
     * @abstract    The execution object
     */
    NLExecution * execution;
    
    /*!
     * @abstract    The shared workspace
     */
    NSWorkspace * workspace;
    
    /*!
     * @abstract    The logger object
     */
    NLLogger * logger;
    
    /*!
     * @abstract    The default file manager
     */
    NSFileManager * fileManager;
    
    /*!
     * @abstract    The default font manager
     */
    NSFontManager * fontManager;
    
    /*!
     * @abstract    The default help manager
     */
    NSHelpManager * helpManager;
    
@private
    
    /*!
     * @abstract    Reserved 1
     * 
     * @discussion  Reserved instance variables to help ensure binary
     *              compatibility with future versions of the class.
     */
    id NL_r1;
    
    /*!
     * @abstract    Reserved 2
     * 
     * @discussion  Reserved instance variables to help ensure binary
     *              compatibility with future versions of the class.
     */
    id NL_r2;
}

/*! @property */
@property( readonly ) NLExecution * execution;

/*! @property */
@property( readonly ) NSWorkspace * workspace;

/*! @property */
@property( readonly ) NLLogger * logger;

/*! @property */
@property( readonly ) NSFileManager * fileManager;

/*! @property */
@property( readonly ) NSFontManager * fontManager;

/*! @property */
@property( readonly ) NSHelpManager * helpManager;

@end
