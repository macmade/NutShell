/*******************************************************************************
 * NutShell Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

/* $Id: NLMacros.h 245 2010-05-30 14:18:05Z  $ */

/*!
 * @header
 * 
 * @discussion  This file contains the C preprocessor macros used internally by
 *              the NutShell Framework. It's not supposed to be public, nor used by
 *              applications that use the NutShell framework
 */

#define NLFATAL( ... )                                      \
    NSException * _csInternalException = [ NSException      \
        exceptionWithName: @"NLFatalException"              \
        reason: [ NSString stringWithFormat: __VA_ARGS__ ]  \
        userInfo: nil                                       \
    ];                                                      \
    @throw _csInternalException;

#define NLMALLOC( var, type )                                       \
    if( NULL == ( var = ( type * )calloc( 1, sizeof( type ) ) ) )   \
    {                                                               \
        NLFATAL( @"Malloc error (%s)\n", strerror( errno ) );       \
    }

#define NLXMALLOC( var, type, x )                                   \
    if( NULL == ( var = ( type * )calloc( x, sizeof( type ) ) ) )   \
    {                                                               \
        NLFATAL( @"Malloc error (%s)\n", strerror( errno ) );       \
    }

#define NLREALLOC( var, type, x )                                               \
    if( NULL == ( var = ( type * )realloc( var, ( x ) * sizeof( type ) ) ) )    \
    {                                                                           \
        NLFATAL( @"Realloc error (%s)\n", strerror( errno ) );                  \
    }

#define NLSIGSET( handler, type, flags, sa1, sa2 )  \
    sa1.sa_handler = handler;                       \
    sigemptyset( &sa1.sa_mask );                    \
    sa1.sa_flags = flags;                           \
    if( sigaction( type, &sa1, &sa2 ) != 0 )        \
    {                                               \
        NLFATAL( @"Sigaction error" );              \
    }
