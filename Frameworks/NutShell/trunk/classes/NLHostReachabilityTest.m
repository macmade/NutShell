/*******************************************************************************
 * Cocos Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

#import "NLHostReachabilityTest.h"

@implementation NLHostReachabilityTest

@synthesize target;
@synthesize flags;
@synthesize hostname;
@synthesize timeout;

+ ( id )testWithHost: ( NSString * )host
{
    id test = [ [ self alloc ] initWithHost: host ];
    
    return [ test autorelease ];
}

- ( id )initWithHost: ( NSString * )host
{
    if( ( self = [ super init ] ) )
    {
        hostname   = [ host copy ];
        target     = SCNetworkReachabilityCreateWithName( kCFAllocatorDefault, [ hostname UTF8String ] );
        timeout    = 5;
        hasFlags   = NO;
        validFlags = NO;
    }
    
    return self;
}

- ( void )dealloc
{
    if( target != NULL )
    {
        CFRelease( target );
    }
    
    [ hostname release ];
    [ super dealloc ];
}

- ( void )getFlags: ( id )nothing
{
    validFlags = SCNetworkReachabilityGetFlags( target, &flags );
    hasFlags   = YES;
}

- ( void )checkTimeout: ( id )nothing
{
    sleep( timeout );
    
    hasFlags   = YES;
    validFlags = NO;
}

- ( BOOL )isReachable
{
    NSRunLoop * runLoop;
    
    [ NSThread detachNewThreadSelector: @selector( getFlags: ) toTarget: self withObject: nil ];
    [ NSThread detachNewThreadSelector: @selector( checkTimeout: ) toTarget: self withObject: nil ];
    
    runLoop = [ NSRunLoop currentRunLoop ];
    
    while( hasFlags == NO )
    {
        [ runLoop runUntilDate: [ NSDate date ] ];
    }
    
    if( !validFlags )
    {
        return NO;
    }
    
    if( flags & kSCNetworkFlagsReachable && ( !( flags & kSCNetworkFlagsConnectionRequired ) || flags & kSCNetworkFlagsConnectionAutomatic ) )
    {
        return YES;
    }
    
    return NO;
}

@end
