/*******************************************************************************
 * Copyright (c) 2011, Jean-David Gadina - www.xs-labs.com
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

/* $Id: NLLogMessage.m 245 2010-05-30 14:18:05Z  $ */

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
