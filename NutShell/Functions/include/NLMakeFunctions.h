/*******************************************************************************
 * NutShell Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

/* $Id: NLMakeFunctions.h 245 2010-05-30 14:18:05Z  $ */

/*!
 * @header
 * 
 * @discussion  This file should not be included directly by application source
 *              files using the NutShell framework. Including 'NutShell.h' is
 *              preferred over importing individual files because it will use a
 *              precompiled version.
 */

/*!
 * abstract     
 */
typedef enum
{
    NLColorTypeRGB = 0,
    NLColorTypeHSB = 1
}
NLColorType;

/*!
 * abstract     
 */
NSColor * NLMakeColor( NSUInteger v1, NSUInteger v2, NSUInteger v3, NSUInteger alpha, NLColorType type );