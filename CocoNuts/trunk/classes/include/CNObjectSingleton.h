// $Id$

// Local includes
#import "CNSingleton.h"
#import "CNObject.h"

@interface CNObjectSingleton: CNObject < CNSingleton >
{}

+ ( id )getInstance;

@end
