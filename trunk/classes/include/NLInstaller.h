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

// Local includes
#import "NLObject.h"

@class NLExecution;

/*!
 * @abstract    Event object
 * 
 * @version     1.0
 * @namespace   NutShell
 */
@interface NLInstaller: NLObject
{
@protected
    
    /*!
     * @abstract    
     */
    BOOL installing;
    
    /*!
     * @abstract    
     */
    BOOL installed;
    
    /*!
     * @abstract    
     */
    double progress;
    
    /*!
     * @abstract    
     */
    FILE * io;
    
    /*!
     * @abstract    
     */
    NSString * packagePath;
    
    /*!
     * @abstract    
     */
    NSString * phase;
    
    /*!
     * @abstract    
     */
    NSString * status;
    
    /*!
     * @abstract    
     */
    NSString * target;
    
    /*!
     * @abstract    
     */
    NLExecution * execution;
    
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
@property( readonly, getter=isInstalling ) BOOL installing;

/*! @property */
@property( readonly, getter=isInstalled ) BOOL installed;

/*! @property */
@property( readonly ) double progress;

/*! @property */
@property( copy, readwrite ) NSString * packagePath;

/*! @property */
@property( readonly ) NSString * phase;

/*! @property */
@property( readonly ) NSString * status;

/*! @property */
@property( copy, readwrite ) NSString * target;

/*!
 * @abstract        
 */
+ ( id )installerWithPackage: ( NSString * )path;

/*!
 * @abstract        
 */
- ( id )initWithPackage: ( NSString * )path;

/*!
 * @abstract        
 */
- ( void )updateInstallerStatus: ( NSTimer * )timer;

/*!
 * @abstract        
 */
- ( OSStatus )install;

/*!
 * @abstract        
 */
- ( OSStatus )installWithTarget: ( NSString * )destTarget;

@end
