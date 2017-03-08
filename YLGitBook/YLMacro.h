//
//  YLMacro.h
//  YLGitBook
//
//  Created by Relly on 20/02/2017.
//  Copyright © 2017 YL. All rights reserved.
//

#ifndef YLMacro_h
#define YLMacro_h
#import "YLNetWorkMacro.h"
#import "YLHeaderMacro.h"

#define MRCLogLastError(db) NSLog(@"lastError: %@, lastErrorCode: %d, lastErrorMessage: %@", [db lastError], [db lastErrorCode], [db lastErrorMessage]);

#endif /* YLMacro_h */
