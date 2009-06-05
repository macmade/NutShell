/*******************************************************************************
 * Cocos Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

#import "CSKeychainItem.h"

@implementation CSKeychainItem

@synthesize itemExists;
@synthesize name;
@synthesize kind;
@synthesize password;
@synthesize username;

+ ( id )createWithName: ( NSString * )itemName
{
    id item = [ [ self alloc ] initWithName: itemName ];
    
    return [ item autorelease ];
}

+ ( id )createWithName: ( NSString * )itemName kind: ( NSString * )itemKind
{
    id item = [ [ self alloc ] initWithName: itemName kind: itemKind ];
    
    return [ item autorelease ];
}

+ ( id )createWithName: ( NSString * )itemName kind: ( NSString * )itemKind username: ( NSString * )itemUser
{
    id item = [ [ self alloc ] initWithName: itemName kind: itemKind username: itemUser ];
    
    return [ item autorelease ];
}

- ( id )initWithName: ( NSString * )itemName
{
    if( ( self = [ super init ] ) ) {
        
        // ...
    }
    
    return self;
}

- ( id )initWithName: ( NSString * )itemName kind: ( NSString * )itemKind
{
    if( ( self = [ super init ] ) ) {
        
        // ...
    }
    
    return self;
}

- ( id )initWithName: ( NSString * )itemName kind: ( NSString * )itemKind username: ( NSString * )itemUser
{
    if( ( self = [ super init ] ) ) {
        
        // ...
    }
    
    return self;
}

- ( BOOL )create
{
    if( ( self = [ super init ] ) ) {
        
        // ...
    }
    
    return self;
}

- ( BOOL )modify: ( NSString * )newPassword
{
    if( ( self = [ super init ] ) ) {
        
        // ...
    }
    
    return self;
}

- ( BOOL )remove
{
    if( ( self = [ super init ] ) ) {
        
        // ...
    }
    
    return self;
}

@end
