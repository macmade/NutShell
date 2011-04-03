/*******************************************************************************
 * NutShell Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
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
    
    id NL_r1;
    id NL_r2;
}

@property( readonly ) SCNetworkReachabilityRef target;
@property( readonly ) SCNetworkConnectionFlags flags;
@property( readonly ) NSString * hostname;
@property( assign, readwrite ) unsigned int timeout;

+ ( id )testWithHost: ( NSString * )host;
- ( id )initWithHost: ( NSString * )host;
- ( BOOL )isReachable;

@end