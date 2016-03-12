//
//  ViewController.m
//  BlockDemo0120
//
//  Created by wangning on 16/1/20.
//  Copyright © 2016年 IT. All rights reserved.
//

#import "ViewController.h"

#import "RegistViewController.h"

#import "HttpManager.h"

@interface ViewController ()

@end

@implementation ViewController
//172.16.11.232
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)loginButtonClick:(UIButton *)sender {
    
    
    
//    HttpManager requestTestWithParameters:nil success:^(id responseObject) {
//        <#code#>
//    } fail:<#^(NSError *error)fail#>
    
    NSDictionary *dic = @{
                          @"command":@"ST_L",
                          @"name":_userName.text,
                          @"psw":_password.text,
                          };
    
    [HttpManager requestLoginWithParameters:dic success:^(id responseObject) {
        
        
        
    } fail:^(NSError *error) {
        
    }];
    
    
    
}
- (IBAction)registButtonClick:(UIButton *)sender {
    
    RegistViewController *registVC = [[RegistViewController alloc]init];
    
    [self presentViewController:registVC animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
