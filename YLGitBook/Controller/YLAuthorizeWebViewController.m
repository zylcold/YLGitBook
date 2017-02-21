//
//  YLAuthorizeWebViewController.m
//  YLGitBook
//
//  Created by Relly on 21/02/2017.
//  Copyright © 2017 YL. All rights reserved.
//

#import "YLAuthorizeWebViewController.h"

@interface YLAuthorizeWebViewController ()

@end

@implementation YLAuthorizeWebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self clearWebCache];
    
    self.title = @"Loading..";
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(closeViewController:)];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)closeViewController:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler
{
    NSString *nextLinkStr = navigationResponse.response.URL.absoluteString;
    if([nextLinkStr hasPrefix:YLRedirectURL]) {
        decisionHandler(WKNavigationResponsePolicyCancel);
        NSRange range = [nextLinkStr rangeOfString:@"code=\\w+" options:NSRegularExpressionSearch];
        if(range.location != NSNotFound) {
            NSString *codeStr = [nextLinkStr substringWithRange:range];
            NSString *code = [codeStr substringFromIndex:5];
            NSLog(@"%@", code);
        }
    }
    decisionHandler(WKNavigationResponsePolicyAllow);
}

@end
