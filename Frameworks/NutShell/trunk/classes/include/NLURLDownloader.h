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
 * @abstract    Event object
 * 
 * @version     1.0
 * @namespace   Cocos
 */
@interface NLURLDownloader: NLObject
{
@protected
    
    /*!
     * @abstract    
     */
    BOOL downloading;
    
    /*!
     * @abstract    
     */
    BOOL downloaded;
    
    /*!
     * @abstract    
     */
    BOOL allowOverwrite;
    
    /*!
     * @abstract    
     */
    long long bytesTotal;
    
    /*!
     * @abstract    
     */
    long long bytesReceived;
    
    /*!
     * @abstract    
     */
    long long lastBytesReceived;
    
    /*!
     * @abstract    
     */
    double bytesPerSecond;
    
    /*!
     * @abstract    
     */
    double percentComplete;
    
    /*!
     * @abstract    
     */
    double secondsRemaining;
    
    /*!
     * @abstract    
     */
    NSURL * url;
    
    /*!
     * @abstract    
     */
    NSString * downloadDirectory;
    
    /*!
     * @abstract    
     */
    NSString * downloadLocation;
    
    /*!
     * @abstract    
     */
    NSURLDownload * download;
    
    /*!
     * @abstract    
     */
    NSURLRequest * request;
    
    /*!
     * @abstract    
     */
    NSURLResponse * response;
    
    /*!
     * @abstract    
     */
    NSTimer * timer;
    
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
@property( readonly, getter=isDownloading ) BOOL downloading;

/*! @property */
@property( readonly, getter=isDownloaded ) BOOL downloaded;

/*! @property */
@property( readonly ) BOOL allowOverwrite;

/*! @property */
@property( readonly ) long long bytesTotal;

/*! @property */
@property( readonly ) long long bytesReceived;

/*! @property */
@property( readonly ) double bytesPerSecond;

/*! @property */
@property( readonly ) double percentComplete;

/*! @property */
@property( readonly ) double secondsRemaining;

/*! @property */
@property( readonly ) NSURL * url;

/*! @property */
@property( copy, readwrite ) NSString * downloadDirectory;

/*! @property */
@property( readonly ) NSString * downloadLocation;

/*!
 * @abstract    
 */
+ ( id )downloaderFromURL: ( NSURL * )urlObject;

/*!
 * @abstract    
 */
+ ( id )downloaderFromString: ( NSString * )str;

/*!
 * @abstract    
 */
- ( id )initWithURL: ( NSURL * )urlObject;

/*!
 * @abstract    
 */
- ( id )initWithString: ( NSString * )str;

/*!
 * @abstract    
 */
- ( BOOL )start;

/*!
 * @abstract    
 */
- ( void )cancel;

@end
