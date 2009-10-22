/*******************************************************************************
 * Cocos Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

// $Id$

/*!
 * @header
 * 
 * @abstract    Cocos framework main header file
 * 
 * @discussion  This file should be included by all application source files
 *              using the Cocos framework for easy building.  Using this file
 *              is preferred over importing individual files because it will use
 *              a precompiled version.
 */

// Functions
#import "CSLogFunctions.h"
#import "CSMakeFunctions.h"

// Categories
#import "CSColor.h"
#import "CSDictionary.h"
#import "CSEventDispatcher.h"
#import "CSFileManager.h"
#import "CSImage.h"
#import "CSScrollView.h"
#import "CSString.h"
#import "CSTextView.h"

// Protocols
#import "CSSingleton.h"

// Classes
#import "CSApplication.h"
#import "CSDelegateChain.h"
#import "CSEvent.h"
#import "CSExecution.h"
#import "CSFileInfos.h"
#import "CSHostReachabilityTest.h"
#import "CSInstaller.h"
#import "CSKeychainItem.h"
#import "CSLogger.h"
#import "CSLogMessage.h"
#import "CSObject.h"
#import "CSObjectSingleton.h"
#import "CSPreferences.h"
#import "CSReflectionClass.h"
#import "CSReflectionMethod.h"
#import "CSReflectionObject.h"
#import "CSReflectionProperty.h"
#import "CSReflectionProtocol.h"
#import "CSReflectionVariable.h"
#import "CSURLDownloader.h"
#import "CSView.h"
#import "CSWindowFader.h"
