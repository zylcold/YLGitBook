//
//  YLBookInfoItem.h
//  YLGitBook
//
//  Created by Relly on 22/02/2017.
//  Copyright © 2017 YL. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YLBookInfoCover, YLAuthorInfo;
@protocol YLBookInfoItem <NSObject>
@property(nonatomic, copy) NSString *id;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *book_description;
@property(nonatomic, strong) YLBookInfoCover *cover;
@property(nonatomic, strong) YLAuthorInfo *author;
@end
