//
//  YLPersistenceProtocol.h
//  YLGitBook
//
//  Created by Relly on 08/03/2017.
//  Copyright © 2017 YL. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YLPersistenceProtocol <NSObject>
- (BOOL)yl_saveOrUpdate;
- (BOOL)yl_delete;
@end
