//
//  YLBookDetailsController.m
//  YLGitBook
//
//  Created by Relly on 24/02/2017.
//  Copyright © 2017 YL. All rights reserved.
//

#import "YLBookDetailsController.h"
#import "YLBookInfo.h"
#import "YLGetBookDetailsRequest.h"
@interface YLBookDetailsController ()

@end

@implementation YLBookDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    YLGetBookDetailsRouteObject *routeObject = [YLGetBookDetailsRouteObject new];
    routeObject.username = self.bookInfo.name;
    routeObject.name = self.bookInfo.title;
    YLGetBookDetailsRequest *request = [YLGetBookDetailsRequest new];
    request.routeObject = routeObject;
    [[[YLClient sharedInstance] performRequest:request] subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    } error:^(NSError * _Nullable error) {
        NSLog(@"%@", error);
    }];
}
@end
