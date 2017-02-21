//
//  YLExploreViewController.m
//  YLGitBook
//
//  Created by Relly on 20/02/2017.
//  Copyright © 2017 YL. All rights reserved.
//

#import "YLExploreViewController.h"
#import "YLAuthorizeWebViewController.h"

@interface YLExploreViewController ()

@end

@implementation YLExploreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)loginButtonOnClick:(id)sender
{    
    YLAuthorizeWebViewController *webView = [[YLAuthorizeWebViewController alloc] init];
    webView.urlStr = [NSString stringWithFormat:@"%@oauth/authorize?client_id=%@&redirect_uri=%@&response_type=code", YLBaseURL, YLClientId, YLRedirectURL];
    UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:webView];
    [self presentViewController:navC animated:YES completion:nil];
}


@end
