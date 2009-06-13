/*******************************************************************************
 * Cocos Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

#import "CSString.h"

@implementation NSString( CSString )

static BOOL CRCTableDefined;
static unsigned long CRCTable[ 256 ];

- ( void )createCRCTable
{
    int i;
    int j;
    unsigned long c;
    
    for( i = 0; i < 256; i++ ) {
        
        c = 0;
        
        for( j = 0; j < 8; j++ ) {
            
            if( c & 1 ) {
                
                c = 0xEDB88320L ^ ( c >> 1 );
                
            } else {
                
                c = c >> 1;
            }
        }
        
        CRCTable[ i ] = c;
    }
}

- ( NSNumber * )crc32
{
    unsigned int i;
    unsigned long c;
    NSRange range;
    
    if( CRCTableDefined == NO ) {
        
        [ self createCRCTable ];
        
        CRCTableDefined = YES;
    }
    
    c = 0L ^ 0xFFFFFFFFL;
    
    for( i = 0; i < [ self length ]; i++ ) {
        
        range.location = i;
        range.length   = 1;
        
        c = CRCTable[ ( c ^ [ [ self substringWithRange: range ] intValue ] ) & 0xFF ] ^ ( c >> 8 );
    }
    
    return [ NSNumber numberWithUnsignedLong: c ^ 0xFFFFFFFFL ];
}

@end
