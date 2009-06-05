/*******************************************************************************
 * Cocos Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

#import "CSTextView.h"

@implementation NSTextView( CSTextView )

- ( void )displayContentOfFile: ( NSString * )filePath
{
    NSString * fileContent;
    
    fileContent = [ [ NSString alloc ] initWithContentsOfFile: filePath ];
    self.string = fileContent;
    
    [ fileContent release ];
}

@end
