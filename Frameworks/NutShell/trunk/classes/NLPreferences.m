/*******************************************************************************
 * NutShell Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

#import "NLPreferences.h"

@implementation NLPreferences

@synthesize defaults;
@synthesize values;

- ( id )init
{
    if( ( self = [ super init ] ) )
    {
        defaults = [ [ NSMutableDictionary dictionaryWithCapacity: 10 ] retain ];
        values   = [ NSUserDefaults standardUserDefaults ];
    }
    
    return self;
}

- ( id )initWithPropertyList: ( NSString * )filename owner: ( id )owner
{
    if( ( self = [ super init ] ) )
    {
        defaults = [ [ NSMutableDictionary dictionaryWithContentsOfFile: [ [ NSBundle bundleForClass: [ owner class ] ] pathForResource: filename ofType: @"plist" ] ] retain ];
        values   = [ NSUserDefaults standardUserDefaults ];
        
        [ values registerDefaults: defaults ];
    }
    
    return self;
}

- ( void )dealloc
{
    [ defaults release ];
    [ super dealloc ];
}

@end
