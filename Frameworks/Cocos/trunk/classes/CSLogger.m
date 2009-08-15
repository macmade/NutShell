/*******************************************************************************
 * Cocos Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

// Local includes
#import "CSLogger.h"
#import "CSLogMessage.h"
#import "CSEventDispatcher.h"

@implementation CSLogger

@synthesize messages;
@synthesize debug;

- ( id )init
{
    if( ( self = [ super init ] ) ) {
        
        messages = [ [ NSMutableArray arrayWithCapacity: 100 ] retain ];
    }
    
    return self;
}

- ( void )dealloc
{
    [ messages release ];
    [ super dealloc ];
}

- ( void )message: ( CSLogMessage * ) message
{
    [ messages addObject: message ];
    
    [ self dispatchEvent: @"MessageReceived" ];
}

- ( void )log: ( NSString * )message
{
   CSLogMessage * msg;
    
    msg = [ [ CSLogMessage alloc ] initWithMessage: message ];
    
    [ messages addObject: msg ];
    
    [ self dispatchEvent: @"MessageReceived" ];
}

- ( void )debug: ( NSString * )message
{
    CSLogMessage * msg;
    
    if( debug == YES ) {
        
        msg      = [ [ CSLogMessage alloc ] initWithMessage: message ];
        msg.type = CSMessageDebug;
        
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
