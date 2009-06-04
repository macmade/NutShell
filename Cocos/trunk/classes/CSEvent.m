/*******************************************************************************
 * Cocos Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

#import "CSEvent.h"

@implementation CSEvent

@synthesize propagating;
@synthesize target;
@synthesize name;

- ( NSString * )description
{
    NSString * description;
    
    description = [ [ super description ] stringByAppendingFormat: @"\n\t- name:\t\t\t%@\n\t- target:\t\t%@\n\t- propagating:\t%i", name, target, propagating ];
    
    return description;
}

- ( id ) init
{
    if( ( self = [ super init ] ) ) {
        
        propagating = YES;
    }
    
    return self;
}

- ( id )initWithName: ( NSString * )eventName
{
    if( ( self = [ self init ] ) ) {
        
        name = [ eventName copy ];
    }
    
    return self;
}

- ( id )initWithTarget: ( id )targetObject
{
    if( ( self = [ self init ] ) ) {
        
        target = targetObject;
    }
    
    return self;
}

- ( id )initWithName: ( NSString * )eventName target: ( id )targetObject
{
    if( ( self = [ self init ] ) ) {
        
        name   = [ eventName copy ];
        target = targetObject;
    }
    
    return self;
}

@end
