// $Id$

// Local includes
#import "MMApplication.h"
#import "MMAuthorization.h"
#import "MMLogger.h"

/**
 * Application base
 *
 * @author      Jean-David Gadina <macmade@eosgarden.com>
 * @version     1.0
 */
@implementation MMApplication

/**
 * Automatic getters/setters
 */
@synthesize authorization;
@synthesize workspace;
@synthesize logger;

/**
 * Object initialization
 * 
 * @return  id      The object's instance
 */
- ( id )init
{
    if( ( self = [ super init ] ) ) {
        
        authorization = [ MMAuthorization getInstance  ];
        workspace     = [ NSWorkspace sharedWorkspace ];
        logger        = [ MMLogger getInstance ];
    }
    
    return self;
}

@end
