/*******************************************************************************
 * Copyright (c) 2011, Jean-David Gadina <macmade@eosgarden.com>
 * Distributed under the Boost Software License, Version 1.0.
 * 
 * Boost Software License - Version 1.0 - August 17th, 2003
 * 
 * Permission is hereby granted, free of charge, to any person or organization
 * obtaining a copy of the software and accompanying documentation covered by
 * this license (the "Software") to use, reproduce, display, distribute,
 * execute, and transmit the Software, and to prepare derivative works of the
 * Software, and to permit third-parties to whom the Software is furnished to
 * do so, all subject to the following:
 * 
 * The copyright notices in the Software and this entire statement, including
 * the above license grant, this restriction and the following disclaimer,
 * must be included in all copies of the Software, in whole or in part, and
 * all derivative works of the Software, unless such copies or derivative
 * works are solely in the form of machine-executable object code generated by
 * a source language processor.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
 * SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
 * FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
 * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
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
