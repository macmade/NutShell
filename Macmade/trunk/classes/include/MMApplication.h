// $Id$

// Used classes
@class MMLogger, MMExecution;

/**
 * Application base
 *
 * @author      Jean-David Gadina <macmade@eosgarden.com>
 * @version     1.0
 */
@interface MMApplication: NSApplication
{
    @protected
    
    /**
     * The authorization object
     */
    MMExecution * execution;
    
    /**
     * The shared workspace
     */
    NSWorkspace * workspace;
    
    /**
     * The logger object
     */
    MMLogger * logger;
}

/**
 * Class properties
 */
@property( readonly ) MMExecution * execution;
@property( readonly ) NSWorkspace * workspace;
@property( readonly ) MMLogger * logger;

@end
