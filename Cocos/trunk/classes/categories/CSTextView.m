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

- ( void )setFontWithNameAndSize: ( NSString * )fontName size: ( int )fontSize
{
    NSFont * font;
    
    font = [ NSFont fontWithName: fontName size: fontSize ];
    
    [ self setFont: font ];
}

- ( void )disablesSoftWrapping
{
    [ [ self textContainer ] setContainerSize:NSMakeSize( FLT_MAX, FLT_MAX ) ];
    [ [ self textContainer ] setWidthTracksTextView: NO ];
    [ self setHorizontallyResizable: YES ];
}

@end
