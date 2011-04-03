/*******************************************************************************
 * NutShell Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

/* $Id: NLImage.m 245 2010-05-30 14:18:05Z  $ */

#import <QuickLook/QuickLook.h>

#import "NLImage.h"

@implementation NSImage( NLImage )

+ ( NSImage * )previewImageForFile:( NSString * )path size:( NSSize )size
{
    CGImageRef img;
    NSURL            * file;
    NSDictionary     * options;
    NSImage          * preview;
    NSBitmapImageRep * bitmap;
    
    file    = [ NSURL fileURLWithPath: path ];
    options = [ NSDictionary dictionary ];
    
    if ( !file )
    {
        return nil;
    }
    
    img = QLThumbnailImageCreate( kCFAllocatorDefault, ( CFURLRef )file, CGSizeMake( size.width, size.height ), ( CFDictionaryRef )options );
    
    if( img == NULL )
    {
        preview = [ [ NSWorkspace sharedWorkspace ] iconForFile: path ];
        
        [ preview setSize: size ];
        
        return preview;
    }
    
    bitmap = [ [ NSBitmapImageRep alloc ] initWithCGImage: img ];
    
    CFRelease( img );
    
    if ( !bitmap )
    {
        return nil;
    }
    
    preview = [ [ NSImage alloc ] initWithSize: [ bitmap size ] ];
    
    [ preview addRepresentation: bitmap ];
    [ bitmap release ];
    
    return [ preview autorelease ];
}

@end
