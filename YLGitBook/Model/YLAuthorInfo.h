//
//  YLAuthorInfo.h
//  YLGitBook
//
//  Created by Relly on 22/02/2017.
//  Copyright © 2017 YL. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 "author": {
 "id": "545c497453dbd6020047c555",
 "type": "User",
 "username": "doctorkowj",
 "name": "KPTaipei",
 "website": "http://kptaipei.tw/",
 "bio": "",
 "verified": true,
 "locked": false,
 "site_admin": false,
 "urls": {
 "profile": "https://www.gitbook.com/@doctorkowj",
 "stars": "https://www.gitbook.com/@doctorkowj/starred",
 "avatar": "https://s.gravatar.com/avatar/93a390e384be306c0c8321e64e3d1c1e?s=220&d=https%3A%2F%2Fwww.gitbook.com%2Fassets%2Fimages%2Favatars%2Fuser.png"
 },
 "permissions": {
 "edit": null,
 "admin": null
 },
 "dates": {
 "created": "2014-11-07T04:24:20.834Z"
 },
 "counts": {}
 }

 */
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
