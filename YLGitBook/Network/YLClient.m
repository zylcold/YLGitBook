//
//  YLClient.m
//  YLGitBook
//
//  Created by Relly on 22/02/2017.
//  Copyright © 2017 YL. All rights reserved.
//

#import "YLClient.h"
#import "WPSessionManager+Protected.h"
@implementation YLClient
- (NSError *)checkResponseObjectOnError:(id)responseObject
{
    NSError *error = [super checkResponseObjectOnError:responseObject];
    if(!error) {
        
    }
    return nil;
}
@end
