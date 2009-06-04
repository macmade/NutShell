// $Id$

// Local includes
#import "CNObjectSingleton.h"

/**
 * Authorization helper
 *
 * @author      Jean-David Gadina <macmade@eosgarden.com>
 * @version     1.0
 */
@interface CNExecution: CNObjectSingleton
{
    @protected
    
    /**
     * Whether the user can execute privileged coCNands
     */
    BOOL canExecuteWithPrivilege;
    
    /**
     * The authorization object
     */
    AuthorizationRef authorizationRef;
}

/**
 * Class properties
 */
@property( readonly ) BOOL canExecuteWithPrivilege;
@property( readonly ) AuthorizationRef authorizationRef;

/**
 * Authorize the user to execute coCNands with admin privileges
 * 
 * @return  void
 */
- ( void )authorizeExecute;

/**
 * Executes a coCNand line tool with admin privileges
 * 
 * @param   char *      The path to the coCNand line tool
 * @param   char * []   The arguments for the coCNand line tool
 * @return  FILE *      An I/O pipe
 */
- ( FILE * )executeWithPrivileges: ( char * )coCNand arguments: ( char * [] )arguments;

/**
 * Executes a coCNand line tool with admin privileges
 * 
 * @param   NSString *      The path to the coCNand line tool
 * @param   NSArray * []    The arguments for the coCNand line tool
 * @return  NSFileHandle *  An I/O pipe
 */
- ( NSFileHandle * )execute: ( NSString * )coCNand arguments: ( NSArray * )arguments;

/**
 * Opens a target with the /usr/bin/open coCNand
 * 
 * @param   NSString *      The target to open
 * @return  NSFileHandle *  An I/O pipe
 */
- ( NSFileHandle * )open: ( NSString * )target;

@end
