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
/**
 "id": "doctorkowj/kppolicy",
 "status": "published",
 "name": "kppolicy",
 "title": "柯文哲【柯Ｐ新政】市政白皮書",
 "description": "台北市未來的發展與建設應該敬愛自然、尊重歷史、關懷人生。一個有反省力、有創造力的城市，不會讓破壞性建設，成為前進的障礙。\r\n",
 "public": true,
 "template": "base",
 "topics": [],
 "license": "nolicense",
 "language": "zh",
 "locked": false,
 "cover": {
     "large": "/cover/book/doctorkowj/kppolicy.jpg?build=1417153371859",
     "small": "/cover/book/doctorkowj/kppolicy.jpg?build=1417153371859&size=small"
 },
 "urls": {
     "git": "https://git.gitbook.com/doctorkowj/kppolicy.git",
     "access": "https://www.gitbook.com/book/doctorkowj/kppolicy",
     "homepage": "https://doctorkowj.gitbooks.io/kppolicy/",
     "read": "https://www.gitbook.com/read/book/doctorkowj/kppolicy",
     "edit": "https://www.gitbook.com/book/doctorkowj/kppolicy/edit",
     "content": "https://doctorkowj.gitbooks.io/kppolicy/content/",
 "download": {
     "epub": "https://www.gitbook.com/download/epub/book/doctorkowj/kppolicy",
     "mobi": "https://www.gitbook.com/download/mobi/book/doctorkowj/kppolicy",
     "pdf": "https://www.gitbook.com/download/pdf/book/doctorkowj/kppolicy"
 }
 },
 "counts": {
     "stars": 81,
     "subscriptions": 120,
     "updates": 0,
     "discussions": 0
 },
 "dates": {
     "build": "2014-11-28T05:42:51.859Z",
     "created": "2014-11-07T04:36:26.883Z"
 },
 "permissions": {
     "edit": false,
     "admin": false,
     "important": false
 },
 "publish": {
     "defaultBranch": null,
     "builder": null
 },
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
 }
 
 */
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
