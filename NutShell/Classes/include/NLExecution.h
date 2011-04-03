/*******************************************************************************
 * NutShell Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

/* $Id: NLExecution.h 245 2010-05-30 14:18:05Z  $ */

/*!
 * @header
 * 
 * @discussion  This file should not be included directly by application source
 *              files using the NutShell framework. Including 'NutShell.h' is
 *              preferred over importing individual files because it will use a
 *              precompiled version.
 */

// Local includes
#import "NLObjectSingleton.h"

/*!
 * @abstract    External tool execution helper
 * 
 * @version     1.0
 * @namespace   NutShell
 */
@interface NLExecution: NLObjectSingleton
{
@protected
    
    /*!
     * @abstract    Whether the user can execute privileged commands
     */
    BOOL canExecuteWithPrivilege;
    
    /*!
     * @abstract    The authorization object
     */
    AuthorizationRef authorizationRef;
    
@private
    
    /*!
     * @abstract    Reserved 1
     * 
     * @discussion  Reserved instance variables to help ensure binary
     *              compatibility with future versions of the class.
     */
    id NL_r1;
    
    /*!
     * @abstract    Reserved 2
     * 
     * @discussion  Reserved instance variables to help ensure binary
     *              compatibility with future versions of the class.
     */
    id NL_r2;
}

/*! @property */
@property( readonly ) BOOL canExecuteWithPrivilege;

/*! @property */
@property( readonly ) AuthorizationRef authorizationRef;

/*!
 * @abstract    Authorize the user to execute command with admin privileges
 * 
 * @return      void
 */
- ( OSStatus )authorizeExecute;

/*!
 * @abstract    Executes a command line tool with admin privileges
 * 
 * @param       command     The path to the command line tool
 * @param       arguments   The arguments for the command line tool
 * @param       io          A file pointer
 * @return      An I/O pipe
 */
- ( OSStatus )executeWithPrivileges: ( char * )command arguments: ( char * [] )arguments io: ( FILE ** ) io;

/*!
 * @abstract    Executes a command line tool with admin privileges
 * 
 * @param       command     The path to the command line tool
 * @param       arguments   The arguments for the command line tool
 * @return      An I/O pipe
 */
- ( NSFileHandle * )execute: ( NSString * )command arguments: ( NSArray * )arguments;

/*!
 * @abstract    Opens a target with the /usr/bin/open command
 * 
 * @param       target  The target to open
 * @return      An I/O pipe
 */
- ( NSFileHandle * )open: ( NSString * )target;

@end