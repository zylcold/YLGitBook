//
//  YLAuthorInfo+YLPersistence.h
//  YLGitBook
//
//  Created by Relly on 08/03/2017.
//  Copyright © 2017 YL. All rights reserved.
//

#import "YLAuthorInfo.h"
#import "YLPersistenceProtocol.h"
@interface YLAuthorInfo (YLPersistence)<YLPersistenceProtocol>
- (BOOL)yl_saveOrUpdate;
- (BOOL)yl_saveOrUpdateWithDB:(FMDatabase *)db;
- (BOOL)yl_delete;
@end
