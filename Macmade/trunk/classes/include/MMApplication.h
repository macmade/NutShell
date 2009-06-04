// $Id$

// Used classes
@class MMLogger, MMAuthorization;

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
    MMAuthorization * authorization;
    
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
@property( readonly ) MMAuthorization * authorization;
@property( readonly ) NSWorkspace * workspace;
@property( readonly ) MMLogger * logger;

@end
