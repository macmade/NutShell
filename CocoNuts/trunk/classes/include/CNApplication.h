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

// Used classes
@class CNLogger, CNExecution;

/**
 * Application base
 *
 * @author      Jean-David Gadina <macmade@eosgarden.com>
 * @version     1.0
 */
@interface CNApplication: NSApplication
{
    @protected
    
    /**
     * The authorization object
     */
    CNExecution * execution;
    
    /**
     * The shared workspace
     */
    NSWorkspace * workspace;
    
    /**
     * The logger object
     */
    CNLogger * logger;
}

/**
 * Class properties
 */
@property( readonly ) CNExecution * execution;
@property( readonly ) NSWorkspace * workspace;
@property( readonly ) CNLogger * logger;

@end
