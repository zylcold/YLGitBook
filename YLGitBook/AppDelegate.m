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
    
    YLClient *client = [[YLClient alloc] initWithBaseURL:[NSURL URLWithString:YLBaseURL]];
    [YLClient setSharedInstance:client];
    
    return YES;
}

@end
