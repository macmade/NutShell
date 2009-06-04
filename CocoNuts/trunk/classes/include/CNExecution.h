/*******************************************************************************
 * CocoNuts Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 * 
 * This file should not be included directly by application source files using
 * the CocoNuts framework. Including 'CocoNuts.h' is preferred over importing
 * individual files because it will use a precompiled version.
 ******************************************************************************/

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
     * Whether the user can execute privileged commands
     */
    BOOL canExecuteWithPrivilege;
    
    /**
     * The authorization object
     */
    AuthorizationRef authorizationRef;
    
@private
    
    /**
     * Reserved instance variables to help ensure binary compatibility with
     * future versions of the class
     */
    id _r1;
    id _r2;
}

/**
 * Class properties
 */
@property( readonly ) BOOL canExecuteWithPrivilege;
@property( readonly ) AuthorizationRef authorizationRef;

/**
 * Authorize the user to execute command with admin privileges
 * 
 * @return  void
 */
- ( void )authorizeExecute;

/**
 * Executes a command line tool with admin privileges
 * 
 * @param   char *      The path to the command line tool
 * @param   char * []   The arguments for the command line tool
 * @return  FILE *      An I/O pipe
 */
- ( FILE * )executeWithPrivileges: ( char * )command arguments: ( char * [] )arguments;

/**
 * Executes a command line tool with admin privileges
 * 
 * @param   NSString *      The path to the command line tool
 * @param   NSArray * []    The arguments for the command line tool
 * @return  NSFileHandle *  An I/O pipe
 */
- ( NSFileHandle * )execute: ( NSString * )command arguments: ( NSArray * )arguments;

/**
 * Opens a target with the /usr/bin/open command
 * 
 * @param   NSString *      The target to open
 * @return  NSFileHandle *  An I/O pipe
 */
- ( NSFileHandle * )open: ( NSString * )target;

@end
