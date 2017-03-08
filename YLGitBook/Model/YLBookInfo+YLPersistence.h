//
//  YLBookInfo+YLPersistence.h
//  YLGitBook
//
//  Created by Relly on 08/03/2017.
//  Copyright © 2017 YL. All rights reserved.
//

#import "YLBookInfo.h"
#import "YLPersistenceProtocol.h"
@interface YLBookInfo (YLPersistence)<YLPersistenceProtocol>
- (BOOL)yl_saveOrUpdate;
- (BOOL)yl_delete;
@end
