/*******************************************************************************
 * Copyright (c) 2011, Jean-David Gadina - www.xs-labs.com
 * Distributed under the Boost Software License, Version 1.0.
 * 
 * Boost Software License - Version 1.0 - August 17th, 2003
 * 
 * Permission is hereby granted, free of charge, to any person or organization
 * obtaining a copy of the software and accompanying documentation covered by
 * this license (the "Software") to use, reproduce, display, distribute,
 * execute, and transmit the Software, and to prepare derivative works of the
 * Software, and to permit third-parties to whom the Software is furnished to
 * do so, all subject to the following:
 * 
 * The copyright notices in the Software and this entire statement, including
 * the above license grant, this restriction and the following disclaimer,
 * must be included in all copies of the Software, in whole or in part, and
 * all derivative works of the Software, unless such copies or derivative
 * works are solely in the form of machine-executable object code generated by
 * a source language processor.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
 * SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
 * FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
 * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 ******************************************************************************/

/* $Id: NLReflectionObject.m 245 2010-05-30 14:18:05Z  $ */

#import <objc/runtime.h>
#import "NLReflectionObject.h"
#import "NLReflectionClass.h"

@implementation NLReflectionObject

@synthesize classReflector;
@synthesize classname;

+ ( id )reflectorFromObject:( id )object
{
    id reflector = [ [ self alloc ] initWithObject: object ];
    
    return [ reflector autorelease ];
}

- ( NSString * )description
{
    NSString * description;
    
    description = [ [ super description ] stringByAppendingFormat: @"\n\t- classname:\t%@", classname ];
    
    return description;
}

- ( id )initWithObject:( id )object
{
    if( ( self = [ super init ] ) )
    {
        classReflector = [ [ NLReflectionClass alloc ] initWithClass: [ object class ] ];
        classname      = [ [ NSString alloc ] initWithString: [ classReflector name ] ];
    }
    
    return self;
}

- ( void )dealloc
{
    [ classReflector release ];
    [ classname release ];
    [ super dealloc ];
}

@end
