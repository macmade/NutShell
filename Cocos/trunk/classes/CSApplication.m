/*******************************************************************************
 * Cocos Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

#import "CSApplication.h"
#import "CSExecution.h"
#import "CSLogger.h"

@implementation CSApplication

@synthesize execution;
@synthesize workspace;
@synthesize logger;
@synthesize fileManager;

- ( id )init
{
    if( ( self = [ super init ] ) ) {
        
        execution   = [ CSExecution getInstance  ];
        workspace   = [ NSWorkspace sharedWorkspace ];
        logger      = [ [ CSLogger alloc ] init ];
        fileManager = [ NSFileManager defaultManager ];
    }
    
    return self;
}

@end
