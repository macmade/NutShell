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

- ( void )appendStringAtEnd: ( NSString * )str
{
    NSRange range;
    
    range = NSMakeRange( [ [ self string ] length ], 0 );
    
    [ self replaceCharactersInRange: range withString: str ];
}

- ( void )moveInsertionPointAtStart
{
    NSRange range;
    
    range = NSMakeRange( 0, 0 );
    
    [ self setSelectedRange: range ];
}

- ( void )moveInsertionPointAtEnd
{
    NSRange range;
    
    range = NSMakeRange( [ [ self string ] length ], 0 );
    
    [ self setSelectedRange: range ];
}

- ( void )scrollToTop
{
    NSRange range;
    
    range = NSMakeRange( 0, 0 );
    
    [ self scrollRangeToVisible: range ];
}

- ( void )scrollToBottom
{
    NSRange range;
    
    range = NSMakeRange( [ [ self string ] length ], 0 );
    
    [ self scrollRangeToVisible: range ];
}

@end
