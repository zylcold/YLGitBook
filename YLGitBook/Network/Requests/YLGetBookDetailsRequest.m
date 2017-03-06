//
//  YLGetBookDetailsRequest.m
//  YLGitBook
//
//  Created by Relly on 24/02/2017.
//  Copyright © 2017 YL. All rights reserved.
//

#import "YLGetBookDetailsRequest.h"
#import "YLBookDetailsResponses.h"
@implementation YLGetBookDetailsRouteObject
@end

@implementation YLGetBookDetailsRequest
+ (NSString *)method
{
    return @"GET";
}

+ (NSString *)pathPattern
{
    return @"/book/:username/:name";
}

+ (Class)responseClass
{
    return [YLBookDetailsResponses class];
}

@end
