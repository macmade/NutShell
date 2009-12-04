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

// System includes
#import <SystemConfiguration/SystemConfiguration.h>

// Local includes
#import "CSObject.h"

@interface CSHostReachabilityTest: NSObject
{
@protected
    
    BOOL hasFlags;
    BOOL validFlags;
    SCNetworkReachabilityRef target;
    SCNetworkConnectionFlags flags;
    NSString * hostname;
    NSUInteger timeout;
    
@private
    
    id CS_r1;
    id CS_r2;
}

@property( readonly ) SCNetworkReachabilityRef target;
@property( readonly ) SCNetworkConnectionFlags flags;
@property( readonly ) NSString * hostname;
@property( assign, readwrite ) NSUInteger timeout;

+ ( id )testWithHost: ( NSString * )host;
- ( id )initWithHost: ( NSString * )host;
- ( BOOL )isReachable;

@end
