/*******************************************************************************
 * Cocos Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

/*!
 * @header
 * 
 * @discussion  This file should not be included directly by application source
 *              files using the Cocos framework. Including 'Cocos.h' is
 *              preferred over importing individual files because it will use a
 *              precompiled version.
 */

// Local includes
#import "CSObjectSingleton.h"

/*!
 * @abstract    External tool execution helper
 * 
 * @version     1.0
 * @namespace   Cocos
 */
@interface CSExecution: CSObjectSingleton
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
    id CS_r1;
    
    /*!
     * @abstract    Reserved 2
     * 
     * @discussion  Reserved instance variables to help ensure binary
     *              compatibility with future versions of the class.
     */
    id CS_r2;
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
- ( void )authorizeExecute;

/*!
 * @abstract    Executes a command line tool with admin privileges
 * 
 * @param       command     The path to the command line tool
 * @param       arguments   The arguments for the command line tool
 * @return      An I/O pipe
 */
- ( FILE * )executeWithPrivileges: ( char * )command arguments: ( char * [] )arguments;

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
