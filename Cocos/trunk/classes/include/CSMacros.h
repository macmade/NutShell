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
 * @discussion  This file contains the C preprocessor macros used internally by
 *              the Cocos Framework. It's not supposed to be public, nor used by
 *              applications that use the Cocos framework
 */

#define CSFATAL( ... )                                      \
    NSException * _csInternalException = [ NSException      \
        exceptionWithName: @"CSFatalException"              \
        reason: [ NSString stringWithFormat: __VA_ARGS__ ]  \
        userInfo: nil                                       \
    ];                                                      \
    @throw _csInternalException;

#define CSMALLOC( var, type )                                       \
    if( NULL == ( var = ( type * )calloc( 1, sizeof( type ) ) ) ) { \
        CSFATAL( @"Malloc error (%s)\n", strerror( errno ) );       \
    }

#define CSXMALLOC( var, type, x )                                   \
    if( NULL == ( var = ( type * )calloc( x, sizeof( type ) ) ) ) { \
        CSFATAL( @"Malloc error (%s)\n", strerror( errno ) );       \
    }

#define CSREALLOC( var, type, x )                                           \
    if( NULL == ( var = ( type * )realloc( var, x * sizeof( type ) ) ) ) {  \
        CSFATAL( "Realloc error (%s)\n", strerror( errno ) );               \
    }
