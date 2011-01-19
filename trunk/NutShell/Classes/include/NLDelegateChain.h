/*******************************************************************************
 * NutShell Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

/* $Id: NLDelegateChain.h 245 2010-05-30 14:18:05Z  $ */

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

/*!
 * @abstract    Delegate chain object
 * 
 * @version     1.0
 * @namespace   NutShell
 */
@interface NLDelegateChain: NSObject
{
@protected
    
    /*!
     * @abstract    
     */
    NSUInteger numberOfDelegates;
    
    /*!
     * @abstract    
     */
    NSUInteger sizeOfDelegatesArray;
    
    /*!
     * @abstract    
     */
    NSMutableDictionary * delegateHashs;
    
    /*!
     * @abstract    
     */
    id * delegates;
    
    /*!
     * @abstract    
     */
    id cocoaDelegate;
    
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

- ( NSArray * )delegates;
- ( id )cocoaDelegate;
- ( void )setCocoaDelegate: ( id )object;
- ( void )addDelegate: ( id )object;
- ( void )removeDelegate: ( id )object;

@end
