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
 * @abstract    Custom view
 * 
 * @version     1.0
 * @namespace   Cocos
 */
@interface CSView: NSView
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
