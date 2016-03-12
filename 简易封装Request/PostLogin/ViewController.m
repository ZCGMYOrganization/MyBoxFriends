//
//  ViewController.m
//  PostLogin
//
//  Created by Mac on 15/9/7.
//  Copyright (c) 2015年 罗炜翔. All rights reserved.
//

#import "ViewController.h"
#import "Header.h"
#import "FreindListViewController.h"
#import "ConnectionTool.h"
#import "RegisterViewController.h"
#import "ASKPostRequest.h"

@interface ViewController ()<NSURLConnectionDataDelegate,SendMessageDelegate,ASKGetRequestDelegate>{
    
    NSMutableData         *_data;
    
    long                 _count;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //10.43
   
    NSString *str = @"http://www.ysapp.cn/esunIndustry/api.php/Index/getPlatformAd";
    
    
    ASKPostRequest *request = [ASKPostRequest requestWithURLString:str delegate:self];
    
    NSString *st1 = @"business_id=43&platform_id=68";
    
    request.requestData = [st1 dataUsingEncoding:NSUTF8StringEncoding];
    
    [request startAsynchronousRequest];
}






#pragma mark 按钮点击事件
- (IBAction)loginButton:(UIButton *)sender {
    
    
    if (sender.tag == 1) {
        
        
        RegisterViewController *registerVC = [[RegisterViewController alloc] init] ;
        
        [self.navigationController pushViewController:registerVC animated:YES];
        
        [registerVC release];
        
        return;
    }
    
    
//    if (self.nameTF.text.length == 0 || self.pwsTF.text == 0) {
//        return;
//    }
    
    
//    ConnectionTool *tool = [[ConnectionTool alloc] initWithMethod:@"POST" WithParameter:[NSString stringWithFormat:@"command=ST_L&name=%@&psw=%@",self.nameTF.text,self.pwsTF.text]];
//    
//    tool.delegate = self;
//    
//    [tool release];
    
    ASKPostRequest *request = [ASKPostRequest requestWithURLString:BASEURL delegate:self];
    
    NSString *str = @"command=ST_L&name=12&psw=12";
    
    request.requestData = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    [request startAsynchronousRequest];
    
    
    
    
}

- (void)requestDidFinishLoading:(ASKGetRequest *)request withResponseData:(NSData *)data{
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"%@",dic);
    
//    self.access_token = [dic objectForKey:@"access_token"];
    
//    
//    if ([[dic objectForKey:@"result"] integerValue] == 1) {
//        
//        
//        FreindListViewController *listVC = [[FreindListViewController alloc] init];
//        
//        
//        [self.navigationController pushViewController:listVC animated:YES];
//        
//        
//        
//        [[NSUserDefaults standardUserDefaults] setObject:self.access_token forKey:@"token"];
//        
//        
//        [[NSUserDefaults standardUserDefaults] synchronize];
//        
//        
//        [listVC release];
    
        
//    }

    
}



- (void)getMessage:(id)data{
    
    
}


- (void)dealloc{
    
    [_data release];
    
    [_nameTF release];
    [_pwsTF release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
