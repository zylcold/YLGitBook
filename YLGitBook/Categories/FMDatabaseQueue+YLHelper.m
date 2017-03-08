//
//  FMDatabaseQueue+YLHelper.m
//  YLGitBook
//
//  Created by Relly on 08/03/2017.
//  Copyright © 2017 YL. All rights reserved.
//

#import "FMDatabaseQueue+YLHelper.h"

@implementation FMDatabaseQueue (YLHelper)
+ (instancetype)sharedInstance
{
    static FMDatabaseQueue *databaseQueue = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *path = [NSString stringWithFormat:@"%@/%@", NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject, @"database.db"];
        NSLog(@"---->db Path:%@", path);
        databaseQueue = [FMDatabaseQueue databaseQueueWithPath:path];
    });
    return databaseQueue;
}
@end
