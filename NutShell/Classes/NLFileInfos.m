/* $Id$ */

#import <sys/stat.h>

#import "NLFileInfos.h"

@implementation NLFileInfos

@synthesize isDirectory;
@synthesize isRegularFile;
@synthesize isSymbolicLink;
@synthesize isSocket;
@synthesize isCharacterSpecial;
@synthesize isBlockSpecial;
@synthesize isUnknown;
@synthesize isImmutable;
@synthesize isAppendOnly;
@synthesize isBusy;
@synthesize isImage;
@synthesize isAudio;
@synthesize flags;
@synthesize extensionIsHidden;
@synthesize isReadable;
@synthesize isWriteable;
@synthesize isExecutable;
@synthesize size;
@synthesize referenceCount;
@synthesize deviceIdentifier;
@synthesize ownerID;
@synthesize groupID;
@synthesize permissions;
@synthesize octalPermissions;
@synthesize systemNumber;
@synthesize systemFileNumber;
@synthesize HFSCreatorCode;
@synthesize HFSTypeCode;
@synthesize numberOfSubFiles;
@synthesize path;
@synthesize url;
@synthesize filename;
@synthesize displayName;
@synthesize fileExtension;
@synthesize parentDirectoryPath;
@synthesize type;
@synthesize humanReadableSize;
@synthesize owner;
@synthesize group;
@synthesize humanReadablePermissions;
@synthesize creationDate;
@synthesize modificationDate;
@synthesize targetFile;
@synthesize gigaByteSymbol;
@synthesize megaByteSymbol;
@synthesize kiloByteSymbol;
@synthesize byteSymbol;

+ ( id )createFromPath: ( NSString * )filePath
{
    NLFileInfos * fileInfos;
    
    fileInfos = [ [ NLFileInfos alloc ] initWithPath: filePath ];
    
    return [ fileInfos autorelease ];
}

- ( void )getPathInfos
{
    filename            = [ [ NSString alloc ] initWithString: [ path lastPathComponent ] ];
    displayName         = [ [ NSString alloc ] initWithString: [ fileManager displayNameAtPath: path ] ];
    fileExtension       = [ [ NSString alloc ] initWithString: [ path pathExtension ] ];
    parentDirectoryPath = [ [ NSString alloc ] initWithString: [ path stringByDeletingLastPathComponent ] ];
}

- ( void )getFileType
{
    isDirectory        = [ attributes objectForKey: NSFileType ] == NSFileTypeDirectory;
    isRegularFile      = [ attributes objectForKey: NSFileType ] == NSFileTypeRegular;
    isSymbolicLink     = [ attributes objectForKey: NSFileType ] == NSFileTypeSymbolicLink;
    isSocket           = [ attributes objectForKey: NSFileType ] == NSFileTypeSocket;
    isCharacterSpecial = [ attributes objectForKey: NSFileType ] == NSFileTypeCharacterSpecial;
    isBlockSpecial     = [ attributes objectForKey: NSFileType ] == NSFileTypeBlockSpecial;
    isUnknown          = [ attributes objectForKey: NSFileType ] == NSFileTypeUnknown;
    
    if( isDirectory == NO && isRegularFile == NO && isSymbolicLink == NO && isSocket == NO && isCharacterSpecial == NO && isBlockSpecial == NO )
    {
        isUnknown = YES;
        type      = [ [ NSString alloc ] initWithString: NSFileTypeUnknown ];
    }
    else
    {
        type = [ [ NSString alloc ] initWithString: [ attributes objectForKey: NSFileType ] ];
    }
}

- ( void )getOwnership
{
    ownerID = ( [ attributes objectForKey: NSFileOwnerAccountID ]        == nil ) ? 0                                          : [ [ attributes objectForKey: NSFileOwnerAccountID ] integerValue ];
    groupID = ( [ attributes objectForKey: NSFileGroupOwnerAccountID ]   == nil ) ? 0                                          : [ [ attributes objectForKey: NSFileGroupOwnerAccountID ] integerValue ];
    owner   = ( [ attributes objectForKey: NSFileOwnerAccountName ]      == nil ) ? [ [ NSString alloc ] initWithString: @"" ] : [ [ attributes objectForKey: NSFileOwnerAccountName ] copy ];
    group   = ( [ attributes objectForKey: NSFileGroupOwnerAccountName ] == nil ) ? [ [ NSString alloc ] initWithString: @"" ] : [ [ attributes objectForKey: NSFileOwnerAccountName ] copy ];
}

- ( void )getPermissions
{
    NSUInteger i;
    NSUInteger u;
    NSUInteger g;
    NSUInteger o;
    NSUInteger uid;
    NSUInteger gid;
    NSUInteger decimalPerms;
    NSNumber * perms;
    NSString * humanPerms;
    
    uid   = getuid();
    gid   = getgid();
    perms = [ attributes objectForKey: NSFilePosixPermissions ];
    
    if( perms == nil )
    {
        permissions              = 0;
        octalPermissions         = 0;
        humanReadablePermissions = [ [ NSString alloc ] initWithString: @"--- --- ---" ];
        isReadable               = NO;
        isWriteable              = NO;
        isExecutable             = NO;
        
        return;
    }
    
    permissions      = [ perms integerValue ];
    decimalPerms     = permissions;
    u                = decimalPerms / 64;
    g                = ( decimalPerms - ( 64 * u ) ) / 8;
    o                = ( decimalPerms - ( 64 * u ) ) - ( 8 * g );
    octalPermissions = ( u * 100 ) + ( g * 10 ) + o;
    humanPerms       = @"";
    
    for( i = 0; i < 3; i++ )
    {
        humanPerms   = [ [ NSString stringWithFormat: @"%@%@%@ ", ( decimalPerms & 4 ) ? @"r" : @"-", ( decimalPerms & 2 ) ? @"w" : @"-", ( decimalPerms & 1 ) ? @"x" : @"-" ] stringByAppendingString: humanPerms ];
        decimalPerms = decimalPerms >> 3;
    }
    
    humanReadablePermissions = [ [ NSString alloc ] initWithString: humanPerms ];
    
    if( ownerID == uid )
    {
        isReadable   = ( u & 4 ) ? YES : NO;
        isWriteable  = ( u & 2 ) ? YES : NO;
        isExecutable = ( u & 1 ) ? YES : NO;
    }
    else if( groupID == gid )
    {
        isReadable   = ( g & 4 ) ? YES : NO;
        isWriteable  = ( g & 2 ) ? YES : NO;
        isExecutable = ( g & 1 ) ? YES : NO;
    }
    else
    {
        isReadable   = ( o & 4 ) ? YES : NO;
        isWriteable  = ( o & 2 ) ? YES : NO;
        isExecutable = ( o & 1 ) ? YES : NO;
    }
    
    if( isReadable == NO && [ fileManager isReadableFileAtPath: path ] == YES )
    {
        isReadable = YES;
    }
    
    if( isWriteable == NO && [ fileManager isWritableFileAtPath: path ] == YES )
    {
        isWriteable = YES;
    }
    
    if( isExecutable == NO && [ fileManager isExecutableFileAtPath: path ] == YES )
    {
        isExecutable = YES;
    }
}

- ( void )getFlags
{
    int err;
    struct stat fileStat;
    
    isImmutable       = ( [ attributes objectForKey: NSFileImmutable ]       == nil ) ? NO : [ [ attributes objectForKey: NSFileImmutable ]       boolValue ];
    isAppendOnly      = ( [ attributes objectForKey: NSFileAppendOnly ]      == nil ) ? NO : [ [ attributes objectForKey: NSFileAppendOnly ]      boolValue ];
    isBusy            = ( [ attributes objectForKey: NSFileBusy ]            == nil ) ? NO : [ [ attributes objectForKey: NSFileBusy ]            boolValue ];
    extensionIsHidden = ( [ attributes objectForKey: NSFileExtensionHidden ] == nil ) ? NO : [ [ attributes objectForKey: NSFileExtensionHidden ] boolValue ];
    
    err = stat( ( char * )[ path cStringUsingEncoding: NSUTF8StringEncoding ], &fileStat );
    
    if( err != 0 )
    {
        return;
    }
    
    flags.archived         = ( fileStat.st_flags & SF_ARCHIVED )  ? YES : NO;
    flags.hidden           = ( fileStat.st_flags & UF_HIDDEN )    ? YES : NO;
    flags.noDump           = ( fileStat.st_flags & UF_NODUMP )    ? YES : NO;
    flags.opaque           = ( fileStat.st_flags & UF_OPAQUE )    ? YES : NO;
    flags.systemAppendOnly = ( fileStat.st_flags & SF_APPEND )    ? YES : NO;
    flags.systemImmutable  = ( fileStat.st_flags & SF_IMMUTABLE ) ? YES : NO;
    flags.userAppendOnly   = ( fileStat.st_flags & UF_APPEND )    ? YES : NO;
    flags.userImmutable    = ( fileStat.st_flags & UF_IMMUTABLE ) ? YES : NO;
}

- ( void )getSize
{
    double     fileSize;
    NSString * sizeUnit;
    
    size = ( [ attributes objectForKey: NSFileSize ] == nil ) ? 0 : [ [ attributes objectForKey: NSFileSize ] integerValue ];
    
    if( size > ( 1024 * 1024 * 1024 ) )
    {
        sizeUnit = self.gigaByteSymbol;
        fileSize = ( double )( ( double )( size / 1024 ) / 1024 ) / 1024;
    }
    else if( size > ( 1024 * 1024 ) )
    {
        sizeUnit = self.megaByteSymbol;
        fileSize = ( double )( size / 1024 ) / 1024;
    }
    else if( size > 1024 )
    {
        sizeUnit = self.kiloByteSymbol;
        fileSize = ( double )( size / 1024 );
    }
    else
    {
        sizeUnit = self.byteSymbol;
        fileSize = size;
    }
    
    humanReadableSize = [ [ NSString alloc ] initWithString: [ NSString stringWithFormat: sizeUnit, fileSize ] ];
}

- ( void )getDates
{
    creationDate     = ( [ attributes objectForKey: NSFileCreationDate ]     == nil ) ? [ [ NSDate date ] retain ] : [ [ attributes objectForKey: NSFileCreationDate ]     retain ];
    modificationDate = ( [ attributes objectForKey: NSFileModificationDate ] == nil ) ? [ [ NSDate date ] retain ] : [ [ attributes objectForKey: NSFileModificationDate ] retain ];
}

- ( void )getFileSystemAttributes
{
    referenceCount   = ( [ attributes objectForKey: NSFileReferenceCount ]   == nil ) ? 0 : [ [ attributes objectForKey: NSFileReferenceCount ]   integerValue ];
    deviceIdentifier = ( [ attributes objectForKey: NSFileDeviceIdentifier ] == nil ) ? 0 : [ [ attributes objectForKey: NSFileDeviceIdentifier ] integerValue ];
    systemNumber     = ( [ attributes objectForKey: NSFileSystemNumber ]     == nil ) ? 0 : [ [ attributes objectForKey: NSFileSystemNumber ]     integerValue ];
    systemFileNumber = ( [ attributes objectForKey: NSFileSystemFileNumber ] == nil ) ? 0 : [ [ attributes objectForKey: NSFileSystemFileNumber ] integerValue ];
    HFSCreatorCode   = ( [ attributes objectForKey: NSFileHFSCreatorCode ]   == nil ) ? 0 : [ [ attributes objectForKey: NSFileHFSCreatorCode ]   integerValue ];
    HFSTypeCode      = ( [ attributes objectForKey: NSFileHFSTypeCode ]      == nil ) ? 0 : [ [ attributes objectForKey: NSFileHFSTypeCode ]      integerValue ];
}

- ( void )getSubTypes
{
    NLFileInfos * infos;
    
    infos = ( isSymbolicLink ) ? targetFile : self;
    
    if
    (
        infos.isRegularFile
        &&
        (
               [ [ infos.fileExtension lowercaseString ] isEqualToString: @"mp3" ]
            || [ [ infos.fileExtension lowercaseString ] isEqualToString: @"aac" ]
            || [ [ infos.fileExtension lowercaseString ] isEqualToString: @"aifc" ]
            || [ [ infos.fileExtension lowercaseString ] isEqualToString: @"aiff" ]
            || [ [ infos.fileExtension lowercaseString ] isEqualToString: @"caf" ]
            || [ [ infos.fileExtension lowercaseString ] isEqualToString: @"m4a" ]
            || [ [ infos.fileExtension lowercaseString ] isEqualToString: @"mp4" ]
            || [ [ infos.fileExtension lowercaseString ] isEqualToString: @"m4r" ]
            || [ [ infos.fileExtension lowercaseString ] isEqualToString: @"3gp" ]
            || [ [ infos.fileExtension lowercaseString ] isEqualToString: @"wav" ]
        )
    )
    {
        isAudio = YES;
    }
    
    if
    (
        infos.isRegularFile
        &&
        (
               [ [ infos.fileExtension lowercaseString ] isEqualToString: @"png" ]
            || [ [ infos.fileExtension lowercaseString ] isEqualToString: @"tif" ]
            || [ [ infos.fileExtension lowercaseString ] isEqualToString: @"tiff" ]
            || [ [ infos.fileExtension lowercaseString ] isEqualToString: @"jpg" ]
            || [ [ infos.fileExtension lowercaseString ] isEqualToString: @"jpeg" ]
            || [ [ infos.fileExtension lowercaseString ] isEqualToString: @"gif" ]
            || [ [ infos.fileExtension lowercaseString ] isEqualToString: @"bmp" ]
            || [ [ infos.fileExtension lowercaseString ] isEqualToString: @"bmpf" ]
            || [ [ infos.fileExtension lowercaseString ] isEqualToString: @"ico" ]
            || [ [ infos.fileExtension lowercaseString ] isEqualToString: @"cur" ]
            || [ [ infos.fileExtension lowercaseString ] isEqualToString: @"xbm" ]
        )
    )
    {
        isImage = YES;
    }
}

- ( id )initWithPath: ( NSString * )filePath
{
    NSString * symLinkTarget;
    
    if( ( self = [ self init ] ) )
    {
        path        = [ filePath copy ];
        fileManager = [ NSFileManager defaultManager ];
        
        if( [ [ path substringToIndex: 1 ] isEqualToString: @"/" ] )
        {
            url = [ [ NSURL URLWithString: [ NSString stringWithFormat: @"file://localhost%@", path ] ] retain ];
        }
        else
        {
            url = [ [ NSURL URLWithString: path ] retain ];
        }
        
        if( [ fileManager fileExistsAtPath: path ] == NO )
        {
            return nil;
        }
        
        attributes = [ [ fileManager attributesOfItemAtPath: path error: NULL ] retain ];
        
        if( attributes == nil )
        {
            return nil;
        }
        
        [ self getPathInfos ];
        [ self getFileType ];
        [ self getOwnership ];
        [ self getPermissions ];
        [ self getFlags ];
        [ self getSize ];
        [ self getDates ];
        [ self getFileSystemAttributes ];
        
        if( isDirectory == YES )
        {
            numberOfSubFiles = [ [ fileManager contentsOfDirectoryAtPath: path error: NULL ] count ];
        }
        
        if( isSymbolicLink == YES )
        {
            symLinkTarget = [ fileManager destinationOfSymbolicLinkAtPath: path error: NULL ];
            
            if( [ symLinkTarget characterAtIndex: 0 ] != '/' )
            {
                if( [ parentDirectoryPath characterAtIndex: [ parentDirectoryPath length ] - 1 ] == '/' )
                {
                    symLinkTarget = [ parentDirectoryPath stringByAppendingString: symLinkTarget ];
                }
                else
                {
                    symLinkTarget = [ NSString stringWithFormat: @"%@/%@", parentDirectoryPath, symLinkTarget ];
                }
            }
            
            targetFile = [ [ NLFileInfos createFromPath: symLinkTarget ] retain ];
        }
        
        [ self getSubTypes ];
    }
    
    return self;
}

- ( id )init
{
    if( ( self = [ super init ] ) )
    {
        self.gigaByteSymbol = @"%.2fGB";
        self.megaByteSymbol = @"%.2fMB";
        self.kiloByteSymbol = @"%.2fKB";
        self.byteSymbol     = @"%.2fB";
    }
    
    return self;
}

- ( void )dealloc
{
    [ path release ];
    [ url release ];
    [ filename release ];
    [ displayName release ];
    [ fileExtension release ];
    [ parentDirectoryPath release ];
    [ attributes release ];
    [ owner release ];
    [ group release ];
    [ humanReadablePermissions release ];
    [ type release ];
    [ humanReadableSize release ];
    [ creationDate release ];
    [ modificationDate release ];
    [ targetFile release ];
    [ super dealloc ];
}

- ( NSString * )description
{
    return [ NSString stringWithFormat:
            @"%@\n"
            "{\n"
            "   Path:                       %@\n"
            "   URL:                        %@\n"
            "   Filename:                   %@\n"
            "   Display name:               %@\n"
            "   File extension:             %@\n"
            "   Parent directory:           %@\n"
            "   Target file:                %@\n"
            "   Type:                       %@\n"
            "   Size:                       %lu\n"
            "   Human readable size:        %@\n"
            "   Owner ID:                   %lu\n"
            "   Owner:                      %@\n"
            "   Group ID:                   %lu\n"
            "   Group:                      %@\n"
            "   Permissions:                %lu\n"
            "   Octal permissions:          %lu\n"
            "   Human readable permissions: %@\n"
            "   Is readable:                %@\n"
            "   Is writeable:               %@\n"
            "   Is executable:              %@\n"
            "   Creation date:              %@\n"
            "   Modification date:          %@\n"
            "   Number of sub-files:        %@\n"
            "   Reference count:            %lu\n"
            "   Device identifier:          %lu\n"
            "   System number:              %lu\n"
            "   System file number:         %lu\n"
            "   HFS creator code:           %lu\n"
            "   HFS type code:              %lu\n"
            "   Flags - Archived:           %@\n"
            "   Flags - Hidden:             %@\n"
            "   Flags - No dump:            %@\n"
            "   Flags - Opaque:             %@\n"
            "   Flags - System append only: %@\n"
            "   Flags - System immutable:   %@\n"
            "   Flags - User append only:   %@\n"
            "   Flags - User immutable:     %@\n"
            "   Is directory:               %@\n"
            "   Is regular file:            %@\n"
            "   Is symbolic link:           %@\n"
            "   Is socket:                  %@\n"
            "   Is character special:       %@\n"
            "   Is block special:           %@\n"
            "   Is unknown:                 %@\n"
            "   Is immutable:               %@\n"
            "   Is append only:             %@\n"
            "   Is busy:                    %@\n"
            "   Extension is hidden:        %@\n"
            "   Is image:                   %@\n"
            "   Is audio:                   %@\n"
            "}",
            [ super description ],
            path,
            [ url description ],
            filename,
            displayName,
            fileExtension,
            parentDirectoryPath,
            ( isSymbolicLink == YES ) ? targetFile.path : @"N/A",
            type,
            ( unsigned long )size,
            humanReadableSize,
            ( unsigned long )ownerID,
            owner,
            ( unsigned long )groupID,
            group,
            ( unsigned long )permissions,
            ( unsigned long )octalPermissions,
            humanReadablePermissions,
            ( isReadable   == YES ) ? @"yes" : @"no",
            ( isWriteable  == YES ) ? @"yes" : @"no",
            ( isExecutable == YES ) ? @"yes" : @"no",
            [ creationDate description ],
            [ modificationDate description ],
            ( isDirectory == YES ) ? [ [ NSNumber numberWithUnsignedInteger: numberOfSubFiles ] stringValue ] : @"N/A",
            ( unsigned long )referenceCount,
            ( unsigned long )deviceIdentifier,
            ( unsigned long )systemNumber,
            ( unsigned long )systemFileNumber,
            ( unsigned long )HFSCreatorCode,
            ( unsigned long )HFSTypeCode,
            ( flags.archived         == YES ) ? @"yes" : @"no",
            ( flags.hidden           == YES ) ? @"yes" : @"no",
            ( flags.noDump           == YES ) ? @"yes" : @"no",
            ( flags.opaque           == YES ) ? @"yes" : @"no",
            ( flags.systemAppendOnly == YES ) ? @"yes" : @"no",
            ( flags.systemImmutable  == YES ) ? @"yes" : @"no",
            ( flags.userAppendOnly   == YES ) ? @"yes" : @"no",
            ( flags.userImmutable    == YES ) ? @"yes" : @"no",
            ( isDirectory            == YES ) ? @"yes" : @"no",
            ( isRegularFile          == YES ) ? @"yes" : @"no",
            ( isSymbolicLink         == YES ) ? @"yes" : @"no",
            ( isSocket               == YES ) ? @"yes" : @"no",
            ( isCharacterSpecial     == YES ) ? @"yes" : @"no",
            ( isBlockSpecial         == YES ) ? @"yes" : @"no",
            ( isUnknown              == YES ) ? @"yes" : @"no",
            ( isImmutable            == YES ) ? @"yes" : @"no",
            ( isAppendOnly           == YES ) ? @"yes" : @"no",
            ( isBusy                 == YES ) ? @"yes" : @"no",
            ( extensionIsHidden      == YES ) ? @"yes" : @"no",
            ( isImage                == YES ) ? @"yes" : @"no",
            ( isAudio                == YES ) ? @"yes" : @"no"
        ];
}

@end
