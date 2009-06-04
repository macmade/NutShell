/*******************************************************************************
 * CocoNuts Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

// Local includes
#import "CNLogger.h"
#import "CNLogMessage.h"
#import "CNEventDispatcher.h"

@implementation CNLogger

@synthesize messages;
@synthesize debug;

- ( id )init
{
    if( ( self = [ super init ] ) ) {
        
        messages = [ [ NSMutableArray arrayWithCapacity: 100 ] retain ];
    }
    
    return self;
}

- ( void )message: ( CNLogMessage * ) message
{
    [ messages addObject: message ];
    
    [ self dispatchEvent: @"MessageReceived" ];
}

- ( void )log: ( NSString * )message
{
   CNLogMessage * msg;
    
    msg = [ [ CNLogMessage alloc ] initWithMessage: message ];
    
    [ messages addObject: msg ];
    
    [ self dispatchEvent: @"MessageReceived" ];
}

- ( void )debug: ( NSString * )message
{
    CNLogMessage * msg;
    
    if( debug == YES ) {
        
        msg      = [ [ CNLogMessage alloc ] initWithMessage: message ];
        msg.type = CNMessageDebug;
        
        [ messages addObject: msg ];
        
        [ self dispatchEvent: @"MessageReceived" ];
    }
}

- ( void )clear
{
    [ messages removeAllObjects ];
    
    [ self dispatchEvent: @"MessageCleared" ];
}

@end
