/*******************************************************************************
 * NutShell Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

#import "NLLogMessage.h"

@implementation NLLogMessage

@synthesize message;
@synthesize date;
@synthesize type;

+ ( id )messageWithMessage: ( NSString * )str
{
    id msg = [ [ self alloc ] initWithMessage: str ];
    
    return [ msg autorelease ];
}

+ ( id )messageWithMessage: ( NSString * )str date: ( NSDate * )messageTime
{
    id msg = [ [ self alloc ] initWithMessage: str date: messageTime ];
    
    return [ msg autorelease ];
}

+ ( id )messageWithMessage: ( NSString * )str date: ( NSDate * )messageTime type: ( int )messageType
{
    id msg = [ [ self alloc ] initWithMessage: str date: messageTime type: messageType ];
    
    return [ msg autorelease ];
}

- ( id )init
{
    if( ( self = [ super init ] ) )
    {
        self.message = @"";
        self.date    = [ NSDate date ];
        self.type    = NLMessageLog;
    }
    
    return self;
}

- ( id )initWithMessage: ( NSString * )str
{
    if( ( self = [ self init ] ) )
    {
        self.message = str;
    }
    
    return self;
}

- ( id )initWithMessage: ( NSString * )str date: ( NSDate * )messageTime
{
    if( ( self = [ self init ] ) )
    {
        self.message = str;
        self.date    = messageTime;
    }
    
    return self;
}

- ( id )initWithMessage: ( NSString * )str date: ( NSDate * )messageTime type: ( int )messageType
{
    if( ( self = [ self init ] ) )
    {
        self.message = str;
        self.date    = messageTime;
        self.type    = messageType;
    }
    
    return self;
}

@end
