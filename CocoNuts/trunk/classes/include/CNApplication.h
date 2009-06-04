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
