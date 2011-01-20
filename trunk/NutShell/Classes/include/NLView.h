/*******************************************************************************
 * NutShell Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

/* $Id: NLView.h 245 2010-05-30 14:18:05Z  $ */

/*!
 * @header
 * 
 * @discussion  This file should not be included directly by application source
 *              files using the NutShell framework. Including 'NutShell.h' is
 *              preferred over importing individual files because it will use a
 *              precompiled version.
 */

/*!
 * @abstract    Custom view
 * 
 * @version     1.0
 * @namespace   NutShell
 */
@interface NLView: NSView
{
@protected
    
    /*!
     * @abstract    
     */
    BOOL hasBackgroundImage;
    
    /*!
     * @abstract    
     */
    NSBorderType borderType;
    
    /*!
     * @abstract    
     */
    NSColor * backgroundColor;
    
    /*!
     * @abstract    
     */
    NSImage * backgroundImage;
    
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
@property( assign, readwrite ) NSBorderType borderType;

/*! @property */
@property( copy, readwrite ) NSColor * backgroundColor;

/*! @property */
@property( copy, readwrite ) NSImage * backgroundImage;

/*!
 * @abstract    
 */
- ( void )drawRect: ( NSRect )rect;

@end