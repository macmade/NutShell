/*******************************************************************************
 * Cocos Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

#import "CSPreferences.h"

@implementation CSPreferences

@synthesize defaults;
@synthesize values;

- ( id )init
{
    if( ( self = [ super init ] ) ) {
        
        defaults = [ NSMutableDictionary dictionaryWithCapacity: 10 ];
        values   = [ NSUserDefaults standardUserDefaults ];
    }
    
    return self;
}


- ( id )initWithPropertyList: ( NSString * )filename
{
    if( ( self = [ super init ] ) ) {
        
        defaults = [ NSMutableDictionary dictionaryWithContentsOfFile: [ [ NSBundle bundleForClass: [ self class ] ] pathForResource: filename ofType: @"plist" ] ];
        values   = [ NSUserDefaults standardUserDefaults ];
        
        [ values registerDefaults: defaults ];
    }
    
    return self;
}

@end
