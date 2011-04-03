/*******************************************************************************
 * Copyright (c) 2011, Jean-David Gadina <macmade@eosgarden.com>
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
