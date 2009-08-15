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
#import "CSInstaller.h"

/*!
 * @abstract    
 * 
 * @version     1.0
 * @namespace   Cocos
 */
@interface CSUIInstaller: CSInstaller
{
@protected
    
    /*!
     * @abstract    
     */
    BOOL indeterminateProgressForNewPhases;
    
    /*!
     * @abstract    
     */
    BOOL playSoundOnInstallComplete;
    
    /*!
     * @abstract    
     */
    NSSound * completeSound;
    
    /*!
     * @abstract    
     */
    NSTextField * phaseText;
    
    /*!
     * @abstract    
     */
    NSTextField * statusText;
    
    /*!
     * @abstract    
     */
    NSProgressIndicator * progressBar;
    
    /*!
     * @abstract    
     */
    NSButton * installButton;
    
    /*!
     * @abstract    
     */
    NSButton * quitButton;
    
@private
    
    /*!
     * @abstract    Reserved 1
     * 
     * @discussion  Reserved instance variables to help ensure binary
     *              compatibility with future versions of the class.
     */
    id CS_r3;
    
    /*!
     * @abstract    Reserved 2
     * 
     * @discussion  Reserved instance variables to help ensure binary
     *              compatibility with future versions of the class.
     */
    id CS_r4;
}

/*! @property */
@property( assign, readwrite ) BOOL indeterminateProgressForNewPhases;

/*! @property */
@property( assign, readwrite ) BOOL playSoundOnInstallComplete;

/*! @property */
@property( copy, readwrite ) NSSound * completeSound;

/*! @property */
@property( assign, readwrite ) NSTextField * phaseText;

/*! @property */
@property( assign, readwrite ) NSTextField * statusText;

/*! @property */
@property( assign, readwrite ) NSProgressIndicator * progressBar;

/*! @property */
@property( assign, readwrite ) NSButton * installButton;

/*! @property */
@property( assign, readwrite ) NSButton * quitButton;

/*!
 * @abstract    
 */
- ( void )install: ( id )sender;

@end
