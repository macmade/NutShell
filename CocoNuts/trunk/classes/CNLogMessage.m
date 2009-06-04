/*******************************************************************************
 * CocoNuts Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

// Local includes
#import "CNLogMessage.h"

/**
 * Log message object
 *
 * @author      Jean-David Gadina <macmade@eosgarden.com>
 * @version     1.0
 */
@implementation CNLogMessage

/**
 * Automatic getters/setters
 */
@synthesize message;
@synthesize date;
@synthesize type;

/**
 * 
 */
- ( id )init
{
    self = [ super init ];
    
    self.message = @"";
    self.date    = [ NSDate date ];
    self.type    = CNMessageLog;
    
    return self;
}

/**
 * 
 */
- ( id )initWithMessage: ( NSString * )str
{
    self = [ self init ];
    
    self.message = str;
    
    return self;
}

/**
 * 
 */
- ( id )initWithMessage: ( NSString * )str date: ( NSDate * )time
{
    self = [ self init ];
    
    self.message = str;
    self.date    = time;
    
    return self;
}

/**
 * 
 */
- ( id )initWithMessage: ( NSString * )str date: ( NSDate * )time type: ( int )messageType
{
    self = [ self init ];
    
    self.message = str;
    self.date    = time;
    self.type    = messageType;
    
    return self;
}

@end
