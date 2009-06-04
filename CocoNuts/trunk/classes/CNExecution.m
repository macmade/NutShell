// $Id$

// Local includes
#import "CNExecution.h"

/**
 * Execution helper
 *
 * @author      Jean-David Gadina <macmade@eosgarden.com>
 * @version     1.0
 */
@implementation CNExecution

/**
 * Automatic getters/setters
 */
@synthesize canExecuteWithPrivilege;
@synthesize authorizationRef;

/**
 * Authorize the user to execute coCNands with admin privileges
 * 
 * @return  void
 */
- ( void )authorizeExecute
{
    // The authorization status
    OSStatus status;
    
    // The authorization flags
    AuthorizationFlags flags;
    
    // The authorization item(s)
    AuthorizationItem item;
    
    // The authorization rights
    AuthorizationRights rights;
    
    // Gets the default authorization flags
    flags  = kAuthorizationFlagDefaults;
    
    // Creates a new authorization
    status = AuthorizationCreate(
                                 NULL,
                                 kAuthorizationEmptyEnvironment,
                                 flags,
                                 &authorizationRef
                                 );
    
    // Checks the authorization status
    if( status == errAuthorizationSuccess ) {
        
        // Authorization item for privileged execution
        item.name        = kAuthorizationRightExecute;
        item.valueLength = 0;
        item.value       = NULL;
        item.flags       = 0;
        
        // Authorization rights
        rights.count = 1;
        rights.items = &item;
        
        // Authorization flags
        flags = kAuthorizationFlagDefaults
        | kAuthorizationFlagInteractionAllowed
        | kAuthorizationFlagPreAuthorize
        | kAuthorizationFlagExtendRights;
        
        // Authorizes user for privileged execution
        status = AuthorizationCopyRights(
                                         authorizationRef,
                                         &rights,
                                         NULL,
                                         flags,
                                         NULL
                                         );
        
        // Checks the authorization status
        if( status == errAuthorizationSuccess ) {
            
            // User is authorized
            canExecuteWithPrivilege = YES;
            return;
        }
    }
    
    // Authorization failure
    canExecuteWithPrivilege = NO;
}

/**
 * Executes a coCNand line tool with admin privileges
 * 
 * @param   char *      The path to the coCNand line tool
 * @param   char * []   The arguments for the coCNand line tool
 * @return  FILE *      An I/O pipe
 */
- ( FILE * )executeWithPrivileges: ( char * )coCNand arguments: ( char * [] )arguments
{
    // File pointer for the coCNand line result
    FILE * io;
    
    // The authorization status
    OSStatus status;
    
    // The authorization flags
    AuthorizationFlags flags;
    
    // Checks if the user is authorized to execute privileged coCNands
    if( canExecuteWithPrivilege == NO ) {
        
        // Authorizes the user
        [ self authorizeExecute ];
    }
    
    // Checks if the user is authorized to execute privileged coCNands
    if( canExecuteWithPrivilege == YES ) {
        
        // Gets the default authorization flags
        flags  = kAuthorizationFlagDefaults;
        
        // Executes the coCNand line tool
        status = AuthorizationExecuteWithPrivileges(
            authorizationRef,
            coCNand,
            flags,
            arguments,
            &io
        );
    }
    
    // Returns the I/O pipe
    return io;
}

/**
 * Executes a coCNand line tool with admin privileges
 * 
 * @param   NSString *      The path to the coCNand line tool
 * @param   NSArray * []    The arguments for the coCNand line tool
 * @return  NSFileHandle *  An I/O pipe
 */
- ( NSFileHandle * )execute: ( NSString * )coCNand arguments: ( NSArray * )arguments
{
    // File pointer for the coCNand line result
    NSFileHandle * io;
    
    // Task object for the execution
    NSTask * task;
    
    // Pipe object
    NSPipe * pipe;
    
    // Creates the task
    task = [ [ NSTask alloc ] init ];
    
    // Sets the coCNand path
    [ task setLaunchPath: coCNand ];
    
    // Sets the arguments
    [task setArguments: arguments ];
    
    // Creates a pipe
    pipe = [ NSPipe pipe ];
    
    // Sets the task output
    [ task setStandardOutput: pipe ];
    
    // Gets the file handle
    io = [ pipe fileHandleForReading ];
    
    // Launches the coCNand
    [ task launch ];
    
    // Returns the I/O pipe
    return io;
}

/**
 * Opens a target with the /usr/bin/open coCNand
 * 
 * @param   NSString *      The target to open
 * @return  NSFileHandle *  An I/O pipe
 */
- ( NSFileHandle * )open: ( NSString * )target
{
    // Arguments list
    NSArray *args;
    
    // Create the arguments array
    args = [ NSArray arrayWithObjects: target, nil ];
    
    // Executes the open coCNand
    return [ self execute: @"/usr/bin/open" arguments: args ];
}

@end
