//
//  YLWebViewController.m
//  YLGitBook
//
//  Created by Relly on 21/02/2017.
//  Copyright © 2017 YL. All rights reserved.
//

#import "YLWebViewController.h"

@interface YLWebViewController ()
@property(nonatomic, strong) WKWebView *webView;
@end

@implementation YLWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (WKWebView *)webView
{
    if(!_webView) {
        _webView = self.configeWebView;
        [self.view addSubview:_webView];
    }
    return _webView;
}

- (WKWebView *)configeWebView
{
    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    webView.navigationDelegate = self;
    return webView;
}

- (void)clearWebCache
{
    NSArray * types = @[WKWebsiteDataTypeMemoryCache, WKWebsiteDataTypeDiskCache];
    NSSet *websiteDataTypes = [NSSet setWithArray:types];
    NSDate *dateFrom = [NSDate dateWithTimeIntervalSince1970:0];
    
    
    [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes:websiteDataTypes modifiedSince:dateFrom completionHandler:^{
    }];
}

- (void)setUrlStr:(NSString *)urlStr
{
    _urlStr = urlStr;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlStr]]];
}

- (void)setHtmlString:(NSString *)htmlString
{
    _htmlString = htmlString;
    [self.webView loadHTMLString:_htmlString baseURL:nil];
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(null_unspecified WKNavigation *)navigation
{
    __weak typeof(YLWebViewController *)wekeSelf = self;
    [webView evaluateJavaScript:@"document.title" completionHandler:^(id _Nullable title, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            __strong typeof(YLWebViewController *)self = wekeSelf;
            self.title = title;
        });
    }];
}
@end

