/*******************************************************************************
 * NutShell Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

/* $Id: NLLogFunctions.m 245 2010-05-30 14:18:05Z  $ */

#import "NLLogFunctions.h"

void NLLog( id object )
{
    NSLog( @"%@", object );
}

void NLLogPoint( NSPoint point )
{
    NSLog( @"X: %f", point.x );
    NSLog( @"Y: %f", point.y );
}

void NLLogSize( NSSize size )
{
    NSLog( @"Width:  %f", size.width );
    NSLog( @"Height: %f", size.height );
}

void NLLogRect( NSRect rect )
{
    NSLog( @"X:      %f", rect.origin.x );
    NSLog( @"Y:      %f", rect.origin.y );
    NSLog( @"Width:  %f", rect.size.width );
    NSLog( @"Height: %f", rect.size.height );
}

void NLLogRange( NSRange range )
{
    NSLog( @"Location:  %i", ( int )range.location );
    NSLog( @"Length:    %i", ( int )range.length );
}
