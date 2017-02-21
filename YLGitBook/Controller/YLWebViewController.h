//
//  YLWebViewController.h
//  YLGitBook
//
//  Created by Relly on 21/02/2017.
//  Copyright © 2017 YL. All rights reserved.
//

#import "YLBaseViewController.h"
#import <WebKit/WebKit.h>
@interface YLWebViewController : YLBaseViewController<WKNavigationDelegate>
@property(nonatomic, copy) NSString *urlStr;
@property(nonatomic, copy) NSString *htmlString;

- (void)clearWebCache;
@end
