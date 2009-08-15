/*******************************************************************************
 * Cocos Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

#import "CSObject.h"
#import "CSDelegateChain.h"

@implementation CSObject

- ( id )init
{
    if( ( self = [ super init ] ) ) {
        
        delegate = [ [ CSDelegateChain alloc ] init ];
    }
    
    return self;
}

- ( void )dealloc
{
    [ delegate release ];
    [ super dealloc ];
}

- ( NSArray * )delegates
{
    return [ [ self delegate ] delegates ];
}

- ( id )delegate
{
    return delegate;
}

- ( void )setDelegate: ( id )object
{
    [ delegate setCocoaDelegate: object ];
}

- ( void )addDelegate: ( id )object
{
    [ delegate addDelegate: object ];
}

- ( void )removeDelegate: ( id )object
{
    [ delegate removeDelegate: object ];
}

@end
