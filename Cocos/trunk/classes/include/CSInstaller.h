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
#import "CSObject.h"

@class CSExecution;

/*!
 * @abstract    Event object
 * 
 * @version     1.0
 * @namespace   Cocos
 */
@interface CSInstaller: CSObject
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
    CSExecution * execution;
    
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
