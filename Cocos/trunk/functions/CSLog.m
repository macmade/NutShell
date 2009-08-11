/*******************************************************************************
 * Cocos Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

#import "CSLog.h"

void CSLog( id object )
{
    NSLog( @"%@", object );
}

void CSLogPoint( NSPoint point )
{
    NSLog( @"X: %f", point.x );
    NSLog( @"Y: %f", point.y );
}

void CSLogSize( NSSize size )
{
    NSLog( @"Width:  %f", size.width );
    NSLog( @"Height: %f", size.height );
}

void CSLogRect( NSRect rect )
{
    NSLog( @"X:      %f", rect.origin.x );
    NSLog( @"Y:      %f", rect.origin.y );
    NSLog( @"Width:  %f", rect.size.width );
    NSLog( @"Height: %f", rect.size.height );
}

void CSLogRange( NSRange range )
{
    NSLog( @"Location:  %i", range.location );
    NSLog( @"Length:    %i", range.length );
}
