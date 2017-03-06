//
//  YLBookAllResponses.h
//  YLGitBook
//
//  Created by Relly on 22/02/2017.
//  Copyright © 2017 YL. All rights reserved.
//

#import "YLResponses.h"
#import <YYModel/YYModel.h>
@class YLBookInfo;
@interface YLBookAllResponses : YLResponses<YYModel>
@property(nonatomic, strong) NSArray<YLBookInfo *> *list;
@property(nonatomic, copy) NSString *limit;
@end
