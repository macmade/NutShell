/*******************************************************************************
 * NutShell Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

/* $Id: NLObject.h 245 2010-05-30 14:18:05Z  $ */

/*!
 * @header
 * 
 * @discussion  This file should not be included directly by application source
 *              files using the NutShell framework. Including 'NutShell.h' is
 *              preferred over importing individual files because it will use a
 *              precompiled version.
 */

/*!
 * @abstract    Base class for all the NutShell the objects
 * 
 * @version     1.0
 * @namespace   NutShell
 */
@interface NLObject: NSObject
{
@protected
    
    /*!
     * @abstract    The logger object
     */
    id delegate;
}

/*! @property */
@property( assign, readwrite ) id delegate;

/*! @property */
@property( readonly ) NSArray * delegates;

/*!
 * @abstract    
 * 
 * @return      
 */
- ( void )addDelegate: ( id )object;

/*!
 * @abstract    
 * 
 * @return      
 */
- ( void )removeDelegate: ( id )object;

@end
