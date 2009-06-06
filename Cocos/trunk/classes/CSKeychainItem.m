/*******************************************************************************
 * Cocos Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

#import "CSKeychainItem.h"

@implementation CSKeychainItem

@synthesize name;
@synthesize itemExists;
@synthesize username;
@synthesize password;

+ ( id )createWithName: ( NSString * )itemName username: ( NSString * )itemUser
{
    id item = [ [ self alloc ] initWithName: itemName username: itemUser ];
    
    return [ item autorelease ];
}

- ( id )initWithName: ( NSString * )itemName username: ( NSString * )itemUser
{
    OSStatus status;
    UInt32 passwordLength;
    void * passwordData;
    
    if( ( self = [ super init ] ) ) {
        
        name     = [ itemName copy ];
        username = [ itemUser copy ];
        
        status = SecKeychainFindGenericPassword(
            NULL,
            [ name length ],
            [ name cStringUsingEncoding: NSUTF8StringEncoding ],
            [ username length ],
            [ username cStringUsingEncoding: NSUTF8StringEncoding ],
            &passwordLength,
            &passwordData,
            &item
        );
        
        if( status == noErr ) {
            
            itemExists = YES;
            password   = [ [ NSString alloc ] initWithCString: passwordData length: passwordLength ];
            
            SecKeychainItemFreeContent(
                NULL,
                passwordData
            );
        }
    }
    
    return self;
}

- ( BOOL )create
{
    OSStatus status;
    
    if( self.itemExists == YES ) {
        
        return YES;
    }
    
    status = SecKeychainAddGenericPassword( 
        NULL,
        [ name length ],
        [ name cStringUsingEncoding: NSUTF8StringEncoding ],
        [ username length ],
        [ username cStringUsingEncoding: NSUTF8StringEncoding ],
        [ password length ],
        [ password cStringUsingEncoding: NSUTF8StringEncoding ],
        &item
    );
    
    return status == noErr;
}

- ( BOOL )modify
{
    OSStatus status;
    
    if( self.itemExists == NO ) {
        
        return [ self create ];
    }
    
    if( self.itemExists == NO ) {
        
        return NO;
    }
    
    status = SecKeychainItemModifyAttributesAndData(
        item,
        NULL,
        [ password length ],
        [ password cStringUsingEncoding: NSUTF8StringEncoding ]
    );
    
    return status == noErr;
}

- ( BOOL )remove
{
    OSStatus status;
    
    if( self.itemExists == NO ) {
        
        return YES;
    }
    
    status = SecKeychainItemDelete( item ); 
    
    return status == noErr;
}

- ( void )dealloc
{
    CFRelease( item );
    
    self.password = nil;
    
    [ name release ];
    [ username release ];
    [ super dealloc ];
}

@end
