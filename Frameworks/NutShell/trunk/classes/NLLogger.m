/*******************************************************************************
 * NutShell Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

// Local includes
#import "NLLogger.h"
#import "NLLogMessage.h"
#import "NLEventDispatcher.h"

@implementation NLLogger

@synthesize messages;
@synthesize debug;

- ( id )init
{
    if( ( self = [ super init ] ) )
    {
        messages = [ [ NSMutableArray arrayWithCapacity: 100 ] retain ];
    }
    
    return self;
}

- ( void )dealloc
{
    [ messages release ];
    [ super dealloc ];
}

- ( void )message: ( NLLogMessage * ) message
{
    [ messages addObject: message ];
    
    [ self dispatchEvent: @"MessageReceived" ];
}

- ( void )log: ( NSString * )message
{
   NLLogMessage * msg;
    
    msg = [ [ NLLogMessage alloc ] initWithMessage: message ];
    
    [ messages addObject: msg ];
    
    [ self dispatchEvent: @"MessageReceived" ];
}

- ( void )debug: ( NSString * )message
{
    NLLogMessage * msg;
    
    if( debug == YES )
    {
        msg      = [ [ NLLogMessage alloc ] initWithMessage: message ];
        msg.type = NLMessageDebug;
        
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
