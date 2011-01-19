/*******************************************************************************
 * NutShell Framework
 * 
 * Copyright (c) 2009, Jean-David Gadina (macmade@eosgarden.com)
 * All rights reserved.
 ******************************************************************************/

/* $Id: NutShell.h 245 2010-05-30 14:18:05Z  $ */

/*!
 * @header
 * 
 * @abstract    NutShell framework main header file
 * 
 * @discussion  This file should be included by all application source files
 *              using the NutShell framework for easy building.  Using this file
 *              is preferred over importing individual files because it will use
 *              a precompiled version.
 */

/* Functions */
#import "NLLogFunctions.h"
#import "NLMakeFunctions.h"

// Categories
#import "NLArray.h"
#import "NLColor.h"
#import "NLDictionary.h"
#import "NLEventDispatcher.h"
#import "NLFileManager.h"
#import "NLImage.h"
#import "NLScrollView.h"
#import "NLString.h"
#import "NLTextView.h"

/* Protocols */
#import "NLSingleton.h"

/* Classes */
#import "NLApplication.h"
#import "NLDelegateChain.h"
#import "NLEvent.h"
#import "NLExecution.h"
#import "NLFileInfos.h"
#import "NLHostReachabilityTest.h"
#import "NLInstaller.h"
#import "NLKeychainItem.h"
#import "NLLogger.h"
#import "NLLogMessage.h"
#import "NLObject.h"
#import "NLObjectSingleton.h"
#import "NLPreferences.h"
#import "NLReflectionClass.h"
#import "NLReflectionMethod.h"
#import "NLReflectionObject.h"
#import "NLReflectionProperty.h"
#import "NLReflectionProtocol.h"
#import "NLReflectionVariable.h"
#import "NLURLDownloader.h"
#import "NLView.h"
#import "NLWindowFader.h"
