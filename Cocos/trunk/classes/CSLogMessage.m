/*******************************************************************************
 * Cocos Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

#import "CSLogMessage.h"

@implementation CSLogMessage

@synthesize message;
@synthesize date;
@synthesize type;

+ ( id )messageWithMessage: ( NSString * )str
{
    id msg = [ [ self alloc ] initWithMessage: str ];
    
    return [ msg autorelease ];
}

+ ( id )messageWithMessage: ( NSString * )str date: ( NSDate * )time
{
    id msg = [ [ self alloc ] initWithMessage: str date: time ];
    
    return [ msg autorelease ];
}

+ ( id )messageWithMessage: ( NSString * )str date: ( NSDate * )time type: ( int )messageType
{
    id msg = [ [ self alloc ] initWithMessage: str date: time type: messageType ];
    
    return [ msg autorelease ];
}

- ( id )init
{
    if( ( self = [ super init ] ) ) {
        
        self.message = @"";
        self.date    = [ NSDate date ];
        self.type    = CSMessageLog;
    }
    
    return self;
}

- ( id )initWithMessage: ( NSString * )str
{
    if( ( self = [ super init ] ) ) {
        
        self.message = str;
    }
    
    return self;
}

- ( id )initWithMessage: ( NSString * )str date: ( NSDate * )time
{
    if( ( self = [ super init ] ) ) {
        
        self.message = str;
        self.date    = time;
    }
    
    return self;
}

- ( id )initWithMessage: ( NSString * )str date: ( NSDate * )time type: ( int )messageType
{
    if( ( self = [ super init ] ) ) {
        
        self.message = str;
        self.date    = time;
        self.type    = messageType;
    }
    
    return self;
}

@end
