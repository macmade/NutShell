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

/*!
 * @abstract    Objective-C protocol reflector
 * 
 * @version     1.0
 * @namespace   NutShell
 */
@interface NLReflectionProtocol: NLObject
{
@protected
    
    /*!
     * @abstract    
     */
    Protocol * protocol;
    
    /*!
     * @abstract    
     */
    NSString * name;
    
    /*!
     * @abstract    
     */
    NSDictionary * properties;
    
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
@property( readonly ) Protocol * protocol;

/*! @property */
@property( readonly ) NSString * name;

/*! @property */
@property( readonly ) NSDictionary * properties;

/*!
 * @abstract    
 */
+ ( id )reflectorFromProtocol:( Protocol * )proto;

/*!
 * @abstract    
 */
+ ( id )reflectorFromProtocolName:( NSString * )protoName;

/*!
 * @abstract    
 */
- ( id )initWithProtocol:( Protocol * )proto;

/*!
 * @abstract    
 */
- ( id )initWithProtocolName:( NSString * )protoName;

/*!
 * 
 */
- ( BOOL )isEqual:( Protocol * )proto;

/*!
 * 
 */
- ( BOOL )isEqualToReflector:( NLReflectionProtocol * )proto;

/*!
 * 
 */
- ( BOOL )conformsToProtocol:( Protocol * )proto;

/*!
 * 
 */
- ( BOOL )conformsToProtocolReflector:( NLReflectionProtocol * )proto;

@end
