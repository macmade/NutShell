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

// Local includes
#import "CNObject.h"

/**
 * Event object
 *
 * @author      Jean-David Gadina <macmade@eosgarden.com>
 * @version     1.0
 */
@interface CNEvent: CNObject
{
    @protected
    
    /**
     * Whether the event is propagating
     */
    BOOL propagating;
    
    /**
     * The event's target object
     */
    id target;
    
    /**
     * The event's name
     */
    NSString * name;
}

/**
 * Class properties
 */
@property( assign, readwrite ) BOOL propagating;
@property( readonly ) id target;
@property( readonly ) NSString *  name;

/**
 * Initializes a newly allocated event with a specific name
 * 
 * @param   NSString *  The event's name
 * @return  id          The instance of the event object
 */
- ( id )initWithName: ( NSString * )eventName;

/**
 * Initializes a newly allocated event with a target object
 * 
 * @param   id      The target object
 * @return  id      The instance of the event object
 */
- ( id )initWithTarget: ( id )targetObject;

/**
 * Initializes a newly allocated event with a specific name and a target object
 * 
 * @param   NSString *  The event's name
 * @param   id          The target object
 * @return  id          The instance of the event object
 */
- ( id )initWithName: ( NSString * )eventName target: ( id )targetObject;

@end
