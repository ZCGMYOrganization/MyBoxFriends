//
//  ViewController.m
//  BlockSinaDemo0119
//
//  Created by wangning on 16/1/19.
//  Copyright © 2016年 IT. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"
#import "HttpManager.h"
#import "StatuseModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:0.5];
}

- (void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    if (![HttpManager isLogin]) {
        
        LoginViewController *loginVC = [[LoginViewController alloc]init];
        
        [loginVC setComplete:^{
            
            [HttpManager getFriendsTimeLineWithBlock:^(NSArray *array) {
                
                for (StatuseModel *status in array) {
                    
                    NSLog(@"%@-%@-%@-%@-%@",status.text,status.source.content,status.source.href,status.user.name,status.user.profile_image_url);
                }
                
            }];
            
            
        }];
        
        
        [self presentViewController:loginVC animated:YES completion:^{
            
            [loginVC release];
        }];        
    }else{
        
        [HttpManager getFriendsTimeLineWithBlock:^(NSArray *array) {
            
            for (StatuseModel *status in array) {
                
                NSLog(@"%@-%@-%@-%@-%@",status.text,status.source.content,status.source.href,status.user.name,status.user.profile_image_url);
            }
            
        }];

        
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
