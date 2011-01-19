/*******************************************************************************
 * NutShell Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

/* $Id: NLApplication.m 245 2010-05-30 14:18:05Z  $ */

#import "NLApplication.h"
#import "NLExecution.h"
#import "NLLogger.h"

@implementation NLApplication

@synthesize execution;
@synthesize workspace;
@synthesize logger;
@synthesize fileManager;
@synthesize fontManager;
@synthesize helpManager;

- ( id )init
{
    if( ( self = [ super init ] ) )
    {
        execution   = [ NLExecution getInstance  ];
        workspace   = [ NSWorkspace sharedWorkspace ];
        logger      = [ [ NLLogger alloc ] init ];
        fileManager = [ NSFileManager defaultManager ];
        fontManager = [ NSFontManager sharedFontManager ];
        helpManager = [ NSHelpManager sharedHelpManager ];
    }
    
    return self;
}

@end
