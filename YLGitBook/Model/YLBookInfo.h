//
//  YLBookInfo.h
//  YLGitBook
//
//  Created by Relly on 22/02/2017.
//  Copyright © 2017 YL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel/YYModel.h>
#import "YLBookInfoItem.h"

@interface YLBookInfoCover : NSObject<YYModel>
@property(nonatomic, copy) NSString *large;
@property(nonatomic, copy) NSString *small;
@end
@interface YLBookInfoDownload: NSObject
@property(nonatomic, copy) NSString *epub;
@property(nonatomic, copy) NSString *mobi;
@property(nonatomic, copy) NSString *pdf;
@end
@interface YLBookInfoCounts: NSObject
@property(nonatomic, copy) NSString *stars;
@property(nonatomic, copy) NSString *subscriptions;
@property(nonatomic, copy) NSString *updates;
@property(nonatomic, copy) NSString *discussions;
@end
@interface YLBookInfoDates : NSObject
@property(nonatomic, copy) NSString *build;
@property(nonatomic, copy) NSString *created;
@end
@class YLAuthorInfo;
@interface YLBookInfo : NSObject<YYModel, YLBookInfoItem>
@property(nonatomic, copy) NSString *id;
@property(nonatomic, copy) NSString *status;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *book_description;
@property(nonatomic, copy) NSString *is_public;
@property(nonatomic, copy) NSString *topics;
@property(nonatomic, copy) NSString *license;
@property(nonatomic, copy) NSString *language;
@property(nonatomic, strong) YLBookInfoCover *cover;
@property(nonatomic, strong) YLBookInfoDownload *download;
@property(nonatomic, strong) YLBookInfoCounts *counts;
@property(nonatomic, strong) YLBookInfoDates *dates;
@property(nonatomic, strong) YLAuthorInfo *author;
@end
