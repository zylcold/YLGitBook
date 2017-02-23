//
//  UIScrollView+RefreshSignal.m
//  YLGitBook
//
//  Created by Relly on 23/02/2017.
//  Copyright © 2017 YL. All rights reserved.
//

#import "UIScrollView+RefreshSignal.h"
#import <MJRefresh/MJRefresh.h>
#import <objc/runtime.h>
@implementation UIScrollView (RefreshSignal)

static void* RACPullToRefreshCommandKey = &RACPullToRefreshCommandKey;
static void* RACPullToRefreshDisponseKey = &RACPullToRefreshDisponseKey;

static void* RACInfinityScrollCommandKey = &RACInfinityScrollCommandKey;
static void* RACInfinityScrollDisponseKey = &RACInfinityScrollDisponseKey;

- (RACCommand *)yl_pullToRefreshCommand
{
    return objc_getAssociatedObject(self, RACPullToRefreshCommandKey);
}

- (RACCommand *)yl_infinityScrollCommand
{
    return objc_getAssociatedObject(self, RACInfinityScrollCommandKey);
}

- (void)setYl_pullToRefreshCommand:(RACCommand *)yl_pullToRefreshCommand
{
    [objc_getAssociatedObject(self, RACPullToRefreshDisponseKey) dispose];
    objc_setAssociatedObject(self, RACPullToRefreshCommandKey, yl_pullToRefreshCommand, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.yl_pullToRefreshCommand execute:yl_pullToRefreshCommand];
    }];
    
    ((MJRefreshNormalHeader *)self.mj_header).lastUpdatedTimeLabel.hidden = YES;
    ((MJRefreshNormalHeader *)self.mj_header).stateLabel.hidden = YES;
    
    //启用状态
    RACDisposable *enableDisponsable = [[[yl_pullToRefreshCommand.enabled combineLatestWith:yl_pullToRefreshCommand.executing] reduceEach:^id(NSNumber *enabled, NSNumber *executing){
        return @(![enabled boolValue] && ![executing boolValue]);
    }] setKeyPath:@keypath(self.mj_header.hidden) onObject:self];
    
    //运行状态
    RACDisposable *executingDisponsable = [yl_pullToRefreshCommand.executing subscribeNext:^(NSNumber * _Nullable x) {
        if([x boolValue]) {
            [self.mj_header beginRefreshing];
        }else {
            [self.mj_header endRefreshing];
        }
    }];
    
    RACDisposable *disponsable = [RACDisposable disposableWithBlock:^{
        [enableDisponsable dispose];
        [executingDisponsable dispose];
    }];
    
    objc_setAssociatedObject(self, RACPullToRefreshDisponseKey, disponsable, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (void)setYl_infinityScrollCommand:(RACCommand *)yl_infinityScrollCommand
{
    [objc_getAssociatedObject(self, RACInfinityScrollDisponseKey) dispose];
    objc_setAssociatedObject(self, RACInfinityScrollCommandKey, yl_infinityScrollCommand, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.mj_footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
        [self.yl_infinityScrollCommand execute:yl_infinityScrollCommand];
    }];
    
    RACDisposable *enableDisponsable = [[[yl_infinityScrollCommand.enabled combineLatestWith:yl_infinityScrollCommand.executing] reduceEach:^id(NSNumber *enabled, NSNumber *executing){
        return @(![enabled boolValue] && ![executing boolValue]);
    }] setKeyPath:@keypath(self.mj_footer.hidden) onObject:self];
    
    RACDisposable *executingDisponsable = [yl_infinityScrollCommand.executing subscribeNext:^(NSNumber * _Nullable x) {
        if([x boolValue]) {
            [self.mj_footer beginRefreshing];
        }else {
            [self.mj_footer endRefreshing];
        }
    }];
    
    RACDisposable *disponsable = [RACDisposable disposableWithBlock:^{
        [enableDisponsable dispose];
        [executingDisponsable dispose];
    }];
    
    objc_setAssociatedObject(self, RACPullToRefreshDisponseKey, disponsable, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
