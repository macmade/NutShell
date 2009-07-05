/*******************************************************************************
 * Cocos Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

#import "CSExecution.h"

@implementation CSExecution

@synthesize canExecuteWithPrivilege;
@synthesize authorizationRef;

- ( OSStatus )authorizeExecute
{
    OSStatus status;
    AuthorizationFlags flags;
    AuthorizationItem item;
    AuthorizationRights rights;
    
    flags  = kAuthorizationFlagDefaults;
    status = AuthorizationCreate(
         NULL,
         kAuthorizationEmptyEnvironment,
         flags,
         &authorizationRef
     );
    
    if( status == errAuthorizationSuccess ) {
        
        item.name        = kAuthorizationRightExecute;
        item.valueLength = 0;
        item.value       = NULL;
        item.flags       = 0;
        
        rights.count = 1;
        rights.items = &item;
        
        flags = kAuthorizationFlagDefaults
              | kAuthorizationFlagInteractionAllowed
              | kAuthorizationFlagPreAuthorize
              | kAuthorizationFlagExtendRights;
        
        status = AuthorizationCopyRights(
             authorizationRef,
             &rights,
             NULL,
             flags,
             NULL
         );
        
        if( status == errAuthorizationSuccess ) {
            
            canExecuteWithPrivilege = YES;
            return status;
        }
    }
    
    canExecuteWithPrivilege = NO;
    return status;
}

- ( OSStatus )executeWithPrivileges: ( char * )command arguments: ( char * [] )arguments io: ( FILE ** )io
{
    OSStatus status;
    AuthorizationFlags flags;
    
    if( canExecuteWithPrivilege == NO ) {
        
        status = [ self authorizeExecute ];
    }
    
    if( canExecuteWithPrivilege == YES ) {
        
        flags  = kAuthorizationFlagDefaults;
        status = AuthorizationExecuteWithPrivileges(
            authorizationRef,
            command,
            flags,
            arguments,
            io
        );
    }
    
    return status;
}

- ( NSFileHandle * )execute: ( NSString * )command arguments: ( NSArray * )arguments
{
    NSFileHandle * io;
    NSTask * task;
    NSPipe * pipe;
    
    task = [ [ NSTask alloc ] init ];
    
    [ task setLaunchPath: command ];
    [task setArguments: arguments ];
    
    pipe = [ NSPipe pipe ];
    
    [ task setStandardOutput: pipe ];
    
    io = [ pipe fileHandleForReading ];
    
    [ task launch ];
    
    return io;
}

- ( NSFileHandle * )open: ( NSString * )target
{
    NSArray *args;
    
    args = [ NSArray arrayWithObjects: target, nil ];
    
    return [ self execute: @"/usr/bin/open" arguments: args ];
}

@end
