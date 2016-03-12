//
//  LoginViewController.m
//  SinaSecondDayDemo0114
//
//  Created by wangning on 16/1/14.
//  Copyright © 2016年 IT. All rights reserved.
//

#import "LoginViewController.h"

#import "HttpManager.h"

@interface LoginViewController ()<UIWebViewDelegate,HttpManagerDelegate>

@property (nonatomic,strong)HttpManager *manager;

@end

//App Key：2695688670
//App Secret：4db99fceff3c9d64848ecd50373ec00e


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
        
        
        _manager = [[HttpManager alloc]init];
        
        _manager.delegate = self;
        
        [_manager getAccessTokenWithCode:code];
        return NO;

    }
    
    
    
    
    return YES;
}


- (void)getAccesstoknSuccess{
    
    if ([self.delegate respondsToSelector:@selector(didGetAccessToken)]) {
        
        [self.delegate didGetAccessToken];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    
    self.manager = nil;
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
