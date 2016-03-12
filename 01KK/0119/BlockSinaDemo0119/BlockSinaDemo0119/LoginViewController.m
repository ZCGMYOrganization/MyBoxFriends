//
//  LoginViewController.m
//  BlockSinaDemo0119
//
//  Created by wangning on 16/1/19.
//  Copyright © 2016年 IT. All rights reserved.
//

#import "LoginViewController.h"
#import "HttpManager.h"

@interface LoginViewController ()<UIWebViewDelegate>

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.frame];
    
    [webView loadRequest:[NSURLRequest requestWithURL:[HttpManager loginURL]]];
    webView.delegate = self;
    
    self.view = webView;
    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    
    if ([request.URL.absoluteString containsString:@"code="]) {
        
        NSString *code = [[request.URL.absoluteString componentsSeparatedByString:@"code="] lastObject];
        
        [HttpManager getAccessTokenWithCode:code completion:^{
        

            if (self.complete) {
                self.complete();
            }
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
        
        return NO;
    }
    
    
    
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    
    self.complete = nil;
    [super dealloc];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
