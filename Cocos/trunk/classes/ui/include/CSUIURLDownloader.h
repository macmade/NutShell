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
#import "CSURLDownloader.h"

/*!
 * @abstract    
 * 
 * @version     1.0
 * @namespace   Cocos
 */
@interface CSUIURLDownloader: CSURLDownloader
{
@protected
    
    /*!
     * @abstract    
     */
    BOOL playSoundOnDownloadComplete;
    
    /*!
     * @abstract    
     */
    NSProgressIndicator * progressBar;
    
    /*!
     * @abstract    
     */
    NSTextField * statusText;
    
    /*!
     * @abstract    
     */
    NSTextField * speedText;
    
    /*!
     * @abstract    
     */
    NSTextField * timeRemainingText;
    
    /*!
     * @abstract    
     */
    NSString * byteSymbol;
    
    /*!
     * @abstract    
     */
    NSString * kiloByteSymbol;
    
    /*!
     * @abstract    
     */
    NSString * megaByteSymbol;
    
    /*!
     * @abstract    
     */
    NSString * gigaByteSymbol;
    
    /*!
     * @abstract    
     */
    NSString * percentSymbol;
    
    /*!
     * @abstract    
     */
    NSString * secondSymbol;
    
    /*!
     * @abstract    
     */
    NSString * secondsSymbol;
    
    /*!
     * @abstract    
     */
    NSString * minuteSymbol;
    
    /*!
     * @abstract    
     */
    NSString * minutesSymbol;
    
    /*!
     * @abstract    
     */
    NSString * hourSymbol;
    
    /*!
     * @abstract    
     */
    NSString * hoursSymbol;
    
    /*!
     * @abstract    
     */
    NSString * daySymbol;
    
    /*!
     * @abstract    
     */
    NSString * daysSymbol;
    
    /*!
     * @abstract    
     */
    NSString * statusFormat;
    
    /*!
     * @abstract    
     */
    NSString * speedFormat;
    
    /*!
     * @abstract    
     */
    NSString * timeRemainingFormat;
    
    /*!
     * @abstract    
     */
    NSString * timeRemainingNoDecimalFormat;
    
    /*!
     * @abstract    
     */
    NSString * errorFormat;
    
    /*!
     * @abstract    
     */
    NSString * errorTitle;
    
    /*!
     * @abstract    
     */
    NSString * errorOk;
    
    /*!
     * @abstract    
     */
    NSString * unknown;
    
    /*!
     * @abstract    
     */
    NSButton * downloadButton;
    
    /*!
     * @abstract    
     */
    NSButton * cancelButton;
    
    /*!
     * @abstract    
     */
    NSSound * completeSound;
    
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
@property( assign, readwrite ) BOOL playSoundOnDownloadComplete;

/*! @property */
@property( assign, readwrite ) NSProgressIndicator * progressBar;

/*! @property */
@property( assign, readwrite ) NSTextField * statusText;

/*! @property */
@property( assign, readwrite ) NSTextField * speedText;

/*! @property */
@property( assign, readwrite ) NSTextField * timeRemainingText;

/*! @property */
@property( copy, readwrite ) NSString * byteSymbol;

/*! @property */
@property( copy, readwrite ) NSString * kiloByteSymbol;

/*! @property */
@property( copy, readwrite ) NSString * megaByteSymbol;

/*! @property */
@property( copy, readwrite ) NSString * gigaByteSymbol;

/*! @property */
@property( copy, readwrite ) NSString * percentSymbol;

/*! @property */
@property( copy, readwrite ) NSString * secondSymbol;

/*! @property */
@property( copy, readwrite ) NSString * secondsSymbol;

/*! @property */
@property( copy, readwrite ) NSString * minuteSymbol;

/*! @property */
@property( copy, readwrite ) NSString * minutesSymbol;

/*! @property */
@property( copy, readwrite ) NSString * hourSymbol;

/*! @property */
@property( copy, readwrite ) NSString * hoursSymbol;

/*! @property */
@property( copy, readwrite ) NSString * daySymbol;

/*! @property */
@property( copy, readwrite ) NSString * daysSymbol;

/*! @property */
@property( copy, readwrite ) NSString * statusFormat;

/*! @property */
@property( copy, readwrite ) NSString * speedFormat;

/*! @property */
@property( copy, readwrite ) NSString * timeRemainingFormat;

/*! @property */
@property( copy, readwrite ) NSString * timeRemainingNoDecimalFormat;

/*! @property */
@property( copy, readwrite ) NSString * errorFormat;

/*! @property */
@property( copy, readwrite ) NSString * errorTitle;

/*! @property */
@property( copy, readwrite ) NSString * errorOk;

/*! @property */
@property( copy, readwrite ) NSString * unknown;

/*! @property */
@property( assign, readwrite ) NSButton * downloadButton;

/*! @property */
@property( assign, readwrite ) NSButton * cancelButton;

/*! @property */
@property( copy, readwrite ) NSSound * completeSound;

@end
