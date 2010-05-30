/*******************************************************************************
 * Cocos Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

#import <sys/stat.h>

#import "NLFileManager.h"
#import "NLDictionary.h"

NSString * const NLFileFlagArchived         = @"NLFileFlagArchived";
NSString * const NLFileFlagHidden           = @"NLFileFlagHidden";
NSString * const NLFileFlagNoDump           = @"NLFileFlagNoDump";
NSString * const NLFileFlagOpaque           = @"NLFileFlagOpaque";
NSString * const NLFileFlagSystemAppendOnly = @"NLFileFlagSystemAppendOnly";
NSString * const NLFileFlagSystemImmutable  = @"NLFileFlagSystemImmutable";
NSString * const NLFileFlagUserAppendOnly   = @"NLFileFlagUserAppendOnly";
NSString * const NLFileFlagUserImmutable    = @"NLFileFlagUserImmutable";

@implementation NSFileManager( NLFileManager )

- ( NSDictionary * )flagsOfItemAtPath: ( NSString * )path error: ( NSError ** )error
{
    int err;
    struct stat fileStat;
    NSDictionary * flags;
    
    err = stat( ( char * )[ path cStringUsingEncoding: NSUTF8StringEncoding ], &fileStat );
    
    if( err != 0 )
    {
        if( error != NULL )
        {
            *( error ) = [ NSError errorWithDomain: NSPOSIXErrorDomain code: err userInfo: nil ];
        }
        
        return nil;
    }
    
    flags = [ NSDictionary dictionaryWithObjectsAndKeys:
                [ NSNumber numberWithBool: ( fileStat.st_flags & SF_ARCHIVED )  ? YES : NO ], NLFileFlagArchived,
                [ NSNumber numberWithBool: ( fileStat.st_flags & UF_HIDDEN )    ? YES : NO ], NLFileFlagHidden,
                [ NSNumber numberWithBool: ( fileStat.st_flags & UF_NODUMP )    ? YES : NO ], NLFileFlagNoDump,
                [ NSNumber numberWithBool: ( fileStat.st_flags & UF_OPAQUE )    ? YES : NO ], NLFileFlagOpaque,
                [ NSNumber numberWithBool: ( fileStat.st_flags & SF_APPEND )    ? YES : NO ], NLFileFlagSystemAppendOnly,
                [ NSNumber numberWithBool: ( fileStat.st_flags & SF_IMMUTABLE ) ? YES : NO ], NLFileFlagSystemImmutable,
                [ NSNumber numberWithBool: ( fileStat.st_flags & UF_APPEND )    ? YES : NO ], NLFileFlagUserAppendOnly,
                [ NSNumber numberWithBool: ( fileStat.st_flags & UF_IMMUTABLE ) ? YES : NO ], NLFileFlagUserImmutable,
                nil
            ];
    
    return flags;
}

- ( BOOL )setFlags: ( NSDictionary * )flags ofItemAtPath: ( NSString * )path error: ( NSError ** )error
{
    int err;
    u_int flagsValue;
    struct stat fileStat;
    
    err = stat( ( char * )[ path cStringUsingEncoding: NSUTF8StringEncoding ], &fileStat );
    
    if( err != 0 )
    {
        if( error != NULL )
        {
            *( error ) = [ NSError errorWithDomain: NSPOSIXErrorDomain code: err userInfo: nil ];
        }
        
        return NO;
    }
    
    flagsValue = fileStat.st_flags;
    
    if( [ flags hasKey: NLFileFlagArchived ] && [ [ flags objectForKey: NLFileFlagArchived ] intValue ] == 0 )
    {
        flagsValue &= ~SF_ARCHIVED;
    }
    else if( [ flags hasKey: NLFileFlagArchived ] )
    {
        flagsValue |= SF_ARCHIVED;
    }
    
    if( [ flags hasKey: NLFileFlagHidden ] && [ [ flags objectForKey: NLFileFlagHidden ] intValue ] == 0 )
    {
        flagsValue &= ~UF_HIDDEN;
    }
    else if( [ flags hasKey: NLFileFlagHidden ] )
    {
        flagsValue |= UF_HIDDEN;
    }
    
    if( [ flags hasKey: NLFileFlagNoDump ] && [ [ flags objectForKey: NLFileFlagNoDump ] intValue ] == 0 )
    {
        flagsValue &= ~UF_NODUMP;
    }
    else if( [ flags hasKey: NLFileFlagNoDump ] )
    {
        flagsValue |= UF_NODUMP;
    }
    
    if( [ flags hasKey: NLFileFlagOpaque ] && [ [ flags objectForKey: NLFileFlagOpaque ] intValue ] == 0 )
    {
        flagsValue &= ~UF_OPAQUE;
    }
    else if( [ flags hasKey: NLFileFlagOpaque ] )
    {
        flagsValue |= UF_OPAQUE;
    }
    
    if( [ flags hasKey: NLFileFlagSystemAppendOnly ] && [ [ flags objectForKey: NLFileFlagSystemAppendOnly ] intValue ] == 0 )
    {
        flagsValue &= ~SF_APPEND;
    }
    else if( [ flags hasKey: NLFileFlagSystemAppendOnly ] )
    {
        flagsValue |= SF_APPEND;
    }
    
    if( [ flags hasKey: NLFileFlagSystemImmutable ] && [ [ flags objectForKey: NLFileFlagSystemImmutable ] intValue ] == 0 )
    {
        flagsValue &= ~SF_IMMUTABLE;
    }
    else if( [ flags hasKey: NLFileFlagSystemImmutable ] )
    {
        flagsValue |= SF_IMMUTABLE;
    }
    
    if( [ flags hasKey: NLFileFlagUserAppendOnly ] && [ [ flags objectForKey: NLFileFlagUserAppendOnly ] intValue ] == 0 )
    {
        flagsValue &= ~UF_APPEND;
    }
    else if( [ flags hasKey: NLFileFlagUserAppendOnly ] )
    {
        flagsValue |= UF_APPEND;
    }
    
    if( [ flags hasKey: NLFileFlagUserImmutable ] && [ [ flags objectForKey: NLFileFlagUserImmutable ] intValue ] == 0 )
    {
        flagsValue &= ~UF_IMMUTABLE;
    }
    else if( [ flags hasKey: NLFileFlagUserImmutable ] )
    {
        flagsValue |= UF_IMMUTABLE;
    }
    
    err = chflags( [ path cStringUsingEncoding: NSUTF8StringEncoding ], flagsValue );
    
    if( err != 0 )
    {
        if( error != NULL )
        {
            *( error ) = [ NSError errorWithDomain: NSPOSIXErrorDomain code: err userInfo: nil ];
        }
        
        return NO;
    }
    
    return YES;
}

@end
