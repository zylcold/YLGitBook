//
//  YLGetBookDetailsRequest.h
//  YLGitBook
//
//  Created by Relly on 24/02/2017.
//  Copyright © 2017 YL. All rights reserved.
//

#import "WPRequest.h"
@interface YLGetBookDetailsRouteObject: YLRouteObject
@property(nonatomic, strong) NSString *username;
@property(nonatomic, strong) NSString *name;
@end
@interface YLGetBookDetailsRequest : WPRequest

@end
