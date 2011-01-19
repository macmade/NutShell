/*******************************************************************************
 * NutShell Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

/* $Id: NLDelegateChain.m 245 2010-05-30 14:18:05Z  $ */

#import "NLDelegateChain.h"

@implementation NLDelegateChain

- ( id )init
{
    if( ( self = [ super init ] ) )
    {
        delegateHashs = [ [ NSMutableDictionary dictionaryWithCapacity: 10 ] retain ];
        
        numberOfDelegates    = 0;
        sizeOfDelegatesArray = 10;
        
        NLXMALLOC( delegates, id, 10 );
    }
    
    return self;
}

- ( void )dealloc
{
    free( delegates );
    [ delegateHashs release ];
    [ super dealloc ];
}

- ( NSMethodSignature * )methodSignatureForSelector: ( SEL )selector
{
    NSUInteger i;
    
    if( [ cocoaDelegate respondsToSelector: selector ] == YES )
    {
        return [ [ cocoaDelegate class ] instanceMethodSignatureForSelector: selector ];
    }
    
    for( i = 0; i < numberOfDelegates; i++ )
    {
        if( [ delegates[ i ] respondsToSelector: selector ] == YES )
        {
            return [ [ delegates[ i ] class ] instanceMethodSignatureForSelector: selector ];
        }
    }
    
    return nil;
}

- ( void )forwardInvocation: ( NSInvocation * )invocation
{
    NSUInteger i;
    
    if( [ cocoaDelegate respondsToSelector: [ invocation selector ] ] == YES )
    {
        [ invocation invokeWithTarget: cocoaDelegate ];
    }
    
    for( i = 0; i < numberOfDelegates; i++ )
    {
        if( [ delegates[ i ] respondsToSelector: [ invocation selector ] ] == YES )
        {
            [ invocation invokeWithTarget: delegates[ i ] ];
        }
    }
}

- ( BOOL )respondsToSelector: ( SEL )selector
{
    NSUInteger i;
    
    if( [ cocoaDelegate respondsToSelector: selector ] == YES )
    {
        return YES;
    }
    
    for( i = 0; i < numberOfDelegates; i++ )
    {
        if( [ delegates[ i ] respondsToSelector: selector ] == YES )
        {
            return YES;
        }
    }
    
    return NO;
}

- ( NSArray * )delegates
{
    NSUInteger i;
    NSMutableArray * delegatesArray;
    
    if( numberOfDelegates == 0 )
    {
        return [ NSArray array ];
    }
    
    delegatesArray = [ NSMutableArray arrayWithCapacity: numberOfDelegates ];
    
    for( i = 0; i < numberOfDelegates; i++ )
    {
        [ delegatesArray addObject: delegates[ i ] ];
    }
    
    return [ NSArray arrayWithArray: delegatesArray ];
}

- ( id )cocoaDelegate
{
    return cocoaDelegate;
}

- ( void )setCocoaDelegate: ( id )object
{
    cocoaDelegate = object;
}

- ( void )addDelegate: ( id )object
{
    NSString * hash;
    
    if( object == nil )
    {
        return;
    }
    
    if( numberOfDelegates == sizeOfDelegatesArray )
    {
        NLREALLOC( delegates, id, sizeOfDelegatesArray + 10 );
        
        sizeOfDelegatesArray += 10;
    }
    
    hash = [ [ NSNumber numberWithUnsignedInteger: ( NSUInteger )object ] stringValue ];
    
    if( [ delegateHashs objectForKey: hash ] != nil )
    {
        return;
    }
    
    delegates[ numberOfDelegates ] = object;
    
    [ delegateHashs setObject: [ NSNumber numberWithUnsignedInteger: numberOfDelegates ] forKey: hash ];
    
    numberOfDelegates++;
}

- ( void )removeDelegate: ( id )object
{
    NSString   * hash;
    NSUInteger   delegateIndex;
    NSUInteger   i;
    
    if( object == nil || numberOfDelegates == 0 )
    {
        return;
    }
    
    hash = [ [ NSNumber numberWithUnsignedInteger: ( NSUInteger )object ] stringValue ];
    
    if( [ delegateHashs objectForKey: hash ] == nil )
    {
        return;
    }
    
    delegateIndex = [ [ delegateHashs objectForKey: hash ] unsignedIntegerValue ];
    
    for( i = delegateIndex; i < numberOfDelegates - 1; i++ )
    {
        delegates[ i ] = delegates[ i + 1 ];
    }
    
    [ delegateHashs removeObjectForKey: hash ];
    
    numberOfDelegates--;
}

@end
