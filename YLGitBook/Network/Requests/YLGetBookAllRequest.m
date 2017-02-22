//
//  YLGetBookAllRequest.m
//  YLGitBook
//
//  Created by Relly on 22/02/2017.
//  Copyright © 2017 YL. All rights reserved.
//

#import "YLGetBookAllRequest.h"
#import "YLBookAllResponses.h"
@implementation YLGetBookAllRequest
+ (NSString *)pathPattern
{
    return @"books/all";
}

+ (NSString *)method
{
    return @"GET";
}
+ (Class)responseClass
{
    return [YLBookAllResponses class];
}
@end
