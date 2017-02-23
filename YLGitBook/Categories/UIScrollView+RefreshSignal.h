//
//  UIScrollView+RefreshSignal.h
//  YLGitBook
//
//  Created by Relly on 23/02/2017.
//  Copyright © 2017 YL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (RefreshSignal)
@property(nonatomic, strong) RACCommand *yl_pullToRefreshCommand;
@property(nonatomic, strong) RACCommand *yl_infinityScrollCommand;
@end
