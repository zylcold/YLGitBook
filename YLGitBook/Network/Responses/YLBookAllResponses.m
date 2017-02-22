//
//  YLBookAllResponses.m
//  YLGitBook
//
//  Created by Relly on 22/02/2017.
//  Copyright © 2017 YL. All rights reserved.
//

#import "YLBookAllResponses.h"
#import "YLBookInfo.h"
@implementation YLBookAllResponses
+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass
{
    return @{@"list" : [YLBookInfo class]};
}
@end
