// $Id$

// Local includes
#import "CNApplication.h"
#import "CNExecution.h"
#import "CNLogger.h"

/**
 * Application base
 *
 * @author      Jean-David Gadina <macmade@eosgarden.com>
 * @version     1.0
 */
@implementation CNApplication

/**
 * Automatic getters/setters
 */
@synthesize execution;
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
        
        execution = [ CNExecution getInstance  ];
        workspace = [ NSWorkspace sharedWorkspace ];
        logger    = [ CNLogger getInstance ];
    }
    
    return self;
}

@end
