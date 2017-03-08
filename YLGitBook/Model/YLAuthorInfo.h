//
//  YLAuthorInfo.h
//  YLGitBook
//
//  Created by Relly on 22/02/2017.
//  Copyright © 2017 YL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel/YYModel.h>
@interface YLAuthorInfoUrls : NSObject
@property(nonatomic, copy) NSString *profile;
@property(nonatomic, copy) NSString *stars;
@property(nonatomic, copy) NSString *avatar;
@end

@interface YLAuthorInfo : NSObject
@property(nonatomic, copy) NSString *id;
@property(nonatomic, copy) NSString *type;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *username;
@property(nonatomic, copy) NSString *website;
@property(nonatomic, copy) NSString *bio;
@property(nonatomic, strong) YLAuthorInfoUrls *urls;
@end
