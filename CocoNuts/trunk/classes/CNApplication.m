/*******************************************************************************
 * CocoNuts Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

#import "CNApplication.h"
#import "CNExecution.h"
#import "CNLogger.h"

@implementation CNApplication

@synthesize execution;
@synthesize workspace;
@synthesize logger;

- ( id )init
{
    if( ( self = [ super init ] ) ) {
        
        execution = [ CNExecution getInstance  ];
        workspace = [ NSWorkspace sharedWorkspace ];
        logger    = [ CNLogger getInstance ];
    }
    
    return self;
}

@end
