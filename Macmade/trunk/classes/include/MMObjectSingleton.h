// $Id$

// Local includes
#import "MMSingleton.h"
#import "MMObject.h"

@interface MMObjectSingleton: MMObject < MMSingleton >

+ ( id )getInstance;

@end
