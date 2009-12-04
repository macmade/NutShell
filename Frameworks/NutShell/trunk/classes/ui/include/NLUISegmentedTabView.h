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

// Local includes
#import "NLObject.h"

/*!
 * @abstract    Application base
 * 
 * @version     1.0
 * @namespace   Cocos
 */
@interface NLUISegmentedTabView: NSView
{
@protected
    
    /*!
     * @abstract    
     */
    NSSegmentedControl * control;
    
    /*!
     * @abstract    
     */
    NSView * view;
    
    /*!
     * @abstract    
     */
    NSMutableArray * views;
    
    /*!
     * @abstract    
     */
    NSMutableArray * titles;
    
    /**
     * @abstract    
     */
    NSString * autoSaveName;
    
    /**
     * @abstract    
     */
    NSUInteger indexOfSelectedView;
    
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
@property( readonly ) NSSegmentedControl * control;

/*! @property */
@property( readonly ) NSView * view;

/*! @property */
@property( readonly ) NSArray * views;

/*! @property */
@property( readonly ) NSArray * titles;

/*! @property */
@property( copy, readwrite ) NSString * autoSaveName;

/*! @property */
@property( assign, readwrite ) NSUInteger indexOfSelectedView;

/*! @property */
@property( readonly ) NSView * selectedView;

/*! @property */
@property( readonly ) NSString * titleOfSelectedView;

/*!
 * @abstract    
 */
- ( void )setControlStyle: ( NSSegmentStyle )style;

/*!
 * @abstract    
 */
- ( void )addView: ( NSView * )viewObject title: ( NSString * )title;

/*!
 * @abstract    
 */
- ( void )removeView: ( NSUInteger )index;

/*!
 * @abstract    
 */
- ( void )selectView: ( NSUInteger )index;

@end
