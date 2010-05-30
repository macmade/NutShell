/* $Id$ */

typedef struct
{
    BOOL archived;
    BOOL hidden;
    BOOL noDump;
    BOOL opaque;
    BOOL systemAppendOnly;
    BOOL systemImmutable;
    BOOL userAppendOnly;
    BOOL userImmutable;
}
NLFileInfosFlags;

@interface NLFileInfos: NSObject
{
@protected
    
    BOOL             isDirectory;
    BOOL             isRegularFile;
    BOOL             isSymbolicLink;
    BOOL             isSocket;
    BOOL             isCharacterSpecial;
    BOOL             isBlockSpecial;
    BOOL             isUnknown;
    BOOL             isImmutable;
    BOOL             isAppendOnly;
    BOOL             isBusy;
    BOOL             extensionIsHidden;
    BOOL             isReadable;
    BOOL             isWriteable;
    BOOL             isExecutable;
    BOOL             isImage;
    BOOL             isAudio;
    NLFileInfosFlags flags;
    NSUInteger       size;
    NSUInteger       referenceCount;
    NSUInteger       deviceIdentifier;
    NSUInteger       ownerID;
    NSUInteger       groupID;
    NSUInteger       permissions;
    NSUInteger       octalPermissions;
    NSUInteger       systemNumber;
    NSUInteger       systemFileNumber;
    NSUInteger       HFSCreatorCode;
    NSUInteger       HFSTypeCode;
    NSUInteger       numberOfSubFiles;
    NSString       * path;
    NSURL          * url;
    NSString       * filename;
    NSString       * displayName;
    NSString       * fileExtension;
    NSString       * parentDirectoryPath;
    NSString       * type;
    NSString       * humanReadableSize;
    NSString       * owner;
    NSString       * group;
    NSString       * humanReadablePermissions;
    NSDate         * creationDate;
    NSDate         * modificationDate;
    NSDictionary   * attributes;
    NSFileManager  * fileManager;
    NLFileInfos    * targetFile;
    NSString       * gigaByteSymbol;
    NSString       * megaByteSymbol;
    NSString       * kiloByteSymbol;
    NSString       * byteSymbol;
    
@private
    
    id r1;
    id r2;
}

@property( readonly ) BOOL isDirectory;
@property( readonly ) BOOL isRegularFile;
@property( readonly ) BOOL isSymbolicLink;
@property( readonly ) BOOL isSocket;
@property( readonly ) BOOL isCharacterSpecial;
@property( readonly ) BOOL isBlockSpecial;
@property( readonly ) BOOL isUnknown;
@property( readonly ) BOOL isImmutable;
@property( readonly ) BOOL isAppendOnly;
@property( readonly ) BOOL isBusy;
@property( readonly ) BOOL extensionIsHidden;
@property( readonly ) BOOL isReadable;
@property( readonly ) BOOL isWriteable;
@property( readonly ) BOOL isExecutable;
@property( readonly ) BOOL isImage;
@property( readonly ) BOOL isAudio;
@property( readonly ) NLFileInfosFlags flags;
@property( readonly ) NSUInteger size;
@property( readonly ) NSUInteger referenceCount;
@property( readonly ) NSUInteger deviceIdentifier;
@property( readonly ) NSUInteger ownerID;
@property( readonly ) NSUInteger groupID;
@property( readonly ) NSUInteger permissions;
@property( readonly ) NSUInteger octalPermissions;
@property( readonly ) NSUInteger systemNumber;
@property( readonly ) NSUInteger systemFileNumber;
@property( readonly ) NSUInteger HFSCreatorCode;
@property( readonly ) NSUInteger HFSTypeCode;
@property( readonly ) NSUInteger numberOfSubFiles;
@property( readonly ) NSString * path;
@property( readonly ) NSURL    * url;
@property( readonly ) NSString * filename;
@property( readonly ) NSString * displayName;
@property( readonly ) NSString * fileExtension;
@property( readonly ) NSString * parentDirectoryPath;
@property( readonly ) NSString * type;
@property( readonly ) NSString * humanReadableSize;
@property( readonly ) NSString * owner;
@property( readonly ) NSString * group;
@property( readonly ) NSString * humanReadablePermissions;
@property( readonly ) NSDate * creationDate;
@property( readonly ) NSDate * modificationDate;
@property( readonly ) NLFileInfos * targetFile;
@property( copy, readwrite ) NSString * gigaByteSymbol;
@property( copy, readwrite ) NSString * megaByteSymbol;
@property( copy, readwrite ) NSString * kiloByteSymbol;
@property( copy, readwrite ) NSString * byteSymbol;

+ ( id )createFromPath: ( NSString * )filePath;
- ( id )initWithPath: ( NSString * )filePath;

@end
