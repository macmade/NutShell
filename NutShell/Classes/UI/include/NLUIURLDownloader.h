/*******************************************************************************
 * Copyright (c) 2011, Jean-David Gadina - www.xs-labs.com
 * Distributed under the Boost Software License, Version 1.0.
 * 
 * Boost Software License - Version 1.0 - August 17th, 2003
 * 
 * Permission is hereby granted, free of charge, to any person or organization
 * obtaining a copy of the software and accompanying documentation covered by
 * this license (the "Software") to use, reproduce, display, distribute,
 * execute, and transmit the Software, and to prepare derivative works of the
 * Software, and to permit third-parties to whom the Software is furnished to
 * do so, all subject to the following:
 * 
 * The copyright notices in the Software and this entire statement, including
 * the above license grant, this restriction and the following disclaimer,
 * must be included in all copies of the Software, in whole or in part, and
 * all derivative works of the Software, unless such copies or derivative
 * works are solely in the form of machine-executable object code generated by
 * a source language processor.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
 * SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
 * FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
 * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 ******************************************************************************/

/* $Id: NLUIURLDownloader.h 245 2010-05-30 14:18:05Z  $ */

/*!
 * @header
 * 
 * @discussion  This file should not be included directly by application source
 *              files using the NutShell framework. Including 'NutShell.h' is
 *              preferred over importing individual files because it will use a
 *              precompiled version.
 */

// Local includes
#import "NLURLDownloader.h"

/*!
 * @abstract    
 * 
 * @version     1.0
 * @namespace   NutShell
 */
@interface NLUIURLDownloader: NLURLDownloader
{
@protected
    
    /*!
     * @abstract    
     */
    BOOL displayErrors;
    
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
    id NL_r3 __attribute__( ( unused ) );
    
    /*!
     * @abstract    Reserved 2
     * 
     * @discussion  Reserved instance variables to help ensure binary
     *              compatibility with future versions of the class.
     */
    id NL_r4 __attribute__( ( unused ) );
}

/*! @property */
@property( assign, readwrite ) BOOL displayErrors;

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
