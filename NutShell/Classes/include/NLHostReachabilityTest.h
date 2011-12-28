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

/* $Id: NLHostReachabilityTest.h 248 2010-08-25 14:12:28Z  $ */

/*!
 * @header
 * 
 * @discussion  This file should not be included directly by application source
 *              files using the NutShell framework. Including 'NutShell.h' is
 *              preferred over importing individual files because it will use a
 *              precompiled version.
 */

// System includes
#import <SystemConfiguration/SystemConfiguration.h>

// Local includes
#import "NLObject.h"

@interface NLHostReachabilityTest: NSObject
{
@protected
    
    BOOL hasFlags;
    BOOL validFlags;
    SCNetworkReachabilityRef target;
    SCNetworkConnectionFlags flags;
    NSString * hostname;
    unsigned int timeout;
    
@private
    
    id NL_r1 __attribute__( ( unused ) );
    id NL_r2 __attribute__( ( unused ) );
}

@property( readonly ) SCNetworkReachabilityRef target;
@property( readonly ) SCNetworkConnectionFlags flags;
@property( readonly ) NSString * hostname;
@property( assign, readwrite ) unsigned int timeout;

+ ( id )testWithHost: ( NSString * )host;
- ( id )initWithHost: ( NSString * )host;
- ( BOOL )isReachable;

@end
