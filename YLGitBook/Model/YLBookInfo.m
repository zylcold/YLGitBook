//
//  YLBookInfo.m
//  YLGitBook
//
//  Created by Relly on 22/02/2017.
//  Copyright © 2017 YL. All rights reserved.
//

#import "YLBookInfo.h"
@implementation YLBookInfoCover
- (void)setSmall:(NSString *)small
{
    _small = [NSString stringWithFormat:@"%@%@", @"https://www.gitbook.com", small];
}

- (void)setLarge:(NSString *)large
{
    _large = [NSString stringWithFormat:@"%@%@", @"https://www.gitbook.com", large];
}
@end
@implementation YLBookInfoDates
@end
@implementation YLBookInfoCounts
@end
@implementation YLBookInfoDownload
@end
@implementation YLBookInfo
+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper
{
    return @{@"book_description" : @"description", @"is_public" : @"public"};
}

@end
