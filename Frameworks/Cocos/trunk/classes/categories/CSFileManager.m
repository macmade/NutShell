/*******************************************************************************
 * Cocos Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

#import <sys/stat.h>

#import "CSFileManager.h"
#import "CSDictionary.h"

NSString * const CSFileFlagArchived         = @"CSFileFlagArchived";
NSString * const CSFileFlagHidden           = @"CSFileFlagHidden";
NSString * const CSFileFlagNoDump           = @"CSFileFlagNoDump";
NSString * const CSFileFlagOpaque           = @"CSFileFlagOpaque";
NSString * const CSFileFlagSystemAppendOnly = @"CSFileFlagSystemAppendOnly";
NSString * const CSFileFlagSystemImmutable  = @"CSFileFlagSystemImmutable";
NSString * const CSFileFlagUserAppendOnly   = @"CSFileFlagUserAppendOnly";
NSString * const CSFileFlagUserImmutable    = @"CSFileFlagUserImmutable";

@implementation NSFileManager( CSFileManager )

- ( NSDictionary * )flagsOfItemAtPath: ( NSString * )path error: ( NSError ** )error;
{
    int err;
    struct stat fileStat;
    NSDictionary * flags;
    
    err = stat( ( char * )[ path cStringUsingEncoding: NSUTF8StringEncoding ], &fileStat );
    
    if( err != 0 ) {
        
        if( error != NULL ) {
            
            *( error ) = [ NSError errorWithDomain: NSPOSIXErrorDomain code: err userInfo: nil ];
        }
        
        return nil;
    }
    
    flags = [ NSDictionary dictionaryWithObjectsAndKeys:
                [ NSNumber numberWithBool: ( fileStat.st_flags & SF_ARCHIVED )  ? YES : NO ], CSFileFlagArchived,
                [ NSNumber numberWithBool: ( fileStat.st_flags & UF_HIDDEN )    ? YES : NO ], CSFileFlagHidden,
                [ NSNumber numberWithBool: ( fileStat.st_flags & UF_NODUMP )    ? YES : NO ], CSFileFlagNoDump,
                [ NSNumber numberWithBool: ( fileStat.st_flags & UF_OPAQUE )    ? YES : NO ], CSFileFlagOpaque,
                [ NSNumber numberWithBool: ( fileStat.st_flags & SF_APPEND )    ? YES : NO ], CSFileFlagSystemAppendOnly,
                [ NSNumber numberWithBool: ( fileStat.st_flags & SF_IMMUTABLE ) ? YES : NO ], CSFileFlagSystemImmutable,
                [ NSNumber numberWithBool: ( fileStat.st_flags & UF_APPEND )    ? YES : NO ], CSFileFlagUserAppendOnly,
                [ NSNumber numberWithBool: ( fileStat.st_flags & UF_IMMUTABLE ) ? YES : NO ], CSFileFlagUserImmutable,
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
    
    if( err != 0 ) {
        
        if( error != NULL ) {
            
            *( error ) = [ NSError errorWithDomain: NSPOSIXErrorDomain code: err userInfo: nil ];
        }
        
        return NO;
    }
    
    flagsValue = fileStat.st_flags;
    
    if( [ flags hasKey: CSFileFlagArchived ] && [ [ flags objectForKey: CSFileFlagArchived ] intValue ] == 0 ) {
        
        flagsValue &= ~SF_ARCHIVED;
        
    } else if( [ flags hasKey: CSFileFlagArchived ] ) {
        
        flagsValue |= SF_ARCHIVED;
    }
    
    if( [ flags hasKey: CSFileFlagHidden ] && [ [ flags objectForKey: CSFileFlagHidden ] intValue ] == 0 ) {
        
        flagsValue &= ~UF_HIDDEN;
        
    } else if( [ flags hasKey: CSFileFlagHidden ] ) {
        
        flagsValue |= UF_HIDDEN;
    }
    
    if( [ flags hasKey: CSFileFlagNoDump ] && [ [ flags objectForKey: CSFileFlagNoDump ] intValue ] == 0 ) {
        
        flagsValue &= ~UF_NODUMP;
        
    } else if( [ flags hasKey: CSFileFlagNoDump ] ) {
        
        flagsValue |= UF_NODUMP;
    }
    
    if( [ flags hasKey: CSFileFlagOpaque ] && [ [ flags objectForKey: CSFileFlagOpaque ] intValue ] == 0 ) {
        
        flagsValue &= ~UF_OPAQUE;
        
    } else if( [ flags hasKey: CSFileFlagOpaque ] ) {
        
        flagsValue |= UF_OPAQUE;
    }
    
    if( [ flags hasKey: CSFileFlagSystemAppendOnly ] && [ [ flags objectForKey: CSFileFlagSystemAppendOnly ] intValue ] == 0 ) {
        
        flagsValue &= ~SF_APPEND;
        
    } else if( [ flags hasKey: CSFileFlagSystemAppendOnly ] ) {
        
        flagsValue |= SF_APPEND;
    }
    
    if( [ flags hasKey: CSFileFlagSystemImmutable ] && [ [ flags objectForKey: CSFileFlagSystemImmutable ] intValue ] == 0 ) {
        
        flagsValue &= ~SF_IMMUTABLE;
        
    } else if( [ flags hasKey: CSFileFlagSystemImmutable ] ) {
        
        flagsValue |= SF_IMMUTABLE;
    }
    
    if( [ flags hasKey: CSFileFlagUserAppendOnly ] && [ [ flags objectForKey: CSFileFlagUserAppendOnly ] intValue ] == 0 ) {
        
        flagsValue &= ~UF_APPEND;
        
    } else if( [ flags hasKey: CSFileFlagUserAppendOnly ] ) {
        
        flagsValue |= UF_APPEND;
    }
    
    if( [ flags hasKey: CSFileFlagUserImmutable ] && [ [ flags objectForKey: CSFileFlagUserImmutable ] intValue ] == 0 ) {
        
        flagsValue &= ~UF_IMMUTABLE;
        
    } else if( [ flags hasKey: CSFileFlagUserImmutable ] ) {
        
        flagsValue |= UF_IMMUTABLE;
    }
    
    err = chflags( [ path cStringUsingEncoding: NSUTF8StringEncoding ], flagsValue );
    
    if( err != 0 ) {
        
        if( error != NULL ) {
            
            *( error ) = [ NSError errorWithDomain: NSPOSIXErrorDomain code: err userInfo: nil ];
        }
        
        return NO;
    }
    
    return YES;
}

@end
