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
 * @abstract    Fading window object
 * 
 * @version     1.0
 * @namespace   Cocos
 */
@interface NLWindowFader: NLObject
{
@protected
    
    /*!
     * @abstract    
     */
    NSWindow * window;
    
    /*!
     * @abstract    
     */
    NSTimer * timer;
    
    /*!
     * @abstract    
     */
    id windowDelegate;
    
    /*!
     * @abstract    
     */
    BOOL isFaded;
    
    /*!
     * @abstract    
     */
    BOOL isFading;
    
    /*!
     * @abstratc    
     */
    BOOL closeAfterFade;
    
    /*!
     * @abstract    
     */
    float fadeBy;
    
    /*!
     * @abstract    
     */
    float fadeInterval;
    
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
@property( readonly ) BOOL isFaded;

/*! @property */
@property( assign, readwrite ) BOOL closeAfterFade;

/*! @property */
@property( assign, readwrite ) float fadeBy;

/*! @property */
@property( assign, readwrite ) float fadeInterval;

/*!
 * @abstract    
 * 
 * @return  
 */
+ ( id )faderWithWindow: ( NSWindow * )windowObject;

/*!
 * @abstract    
 * 
 * @return  
 */
- ( id )initWithWindow: ( NSWindow * )windowObject;

/*!
 * @abstract    
 * 
 * @return  
 */
- ( IBAction )fade: ( id )sender;

/*!
 * @abstract    
 * 
 * @return  
 */
- ( IBAction )unFade: ( id )sender;

/*!
 * @abstract    
 * 
 * @return  
 */
- ( void )fade;

/*!
 * @abstract    
 * 
 * @return  
 */
- ( void )unFade;

/*!
 * @abstract    
 * 
 * @return  
 */
- ( void )fadeTo: ( float )alphaValue;

/*!
 * @abstract    
 * 
 * @return  
 */
- ( void )unFadeTo: ( float )alphaValue;

@end
