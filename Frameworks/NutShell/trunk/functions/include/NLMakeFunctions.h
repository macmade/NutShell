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

/*!
 * abstract     
 */
typedef enum {
    
    NLColorTypeRGB = 0,
    NLColorTypeHSB = 1
    
} NLColorType;

/*!
 * abstract     
 */
NSColor * NLMakeColor( NSUInteger v1, NSUInteger v2, NSUInteger v3, NSUInteger alpha, NLColorType type );
