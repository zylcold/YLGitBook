//
//  AppDelegate.m
//  YLGitBook
//
//  Created by Relly on 20/02/2017.
//  Copyright © 2017 YL. All rights reserved.
//

#import "AppDelegate.h"
#import "YLClient.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self configureFMDB];
    YLClient *client = [[YLClient alloc] initWithBaseURL:[NSURL URLWithString:YLBaseURL]];
    [YLClient setSharedInstance:client];
    
    return YES;
}

- (void)configureFMDB
{
    [[FMDatabaseQueue sharedInstance] inDatabase:^(FMDatabase *db) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"version1" ofType:@"sql"];
        NSString *sql = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        if(![db executeStatements:sql]) {
            MRCLogLastError(db);
        }
        
    }];
}

@end
