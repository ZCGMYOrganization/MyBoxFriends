//
//  ViewController.m
//  SinaSecondDayDemo0114
//
//  Created by wangning on 16/1/14.
//  Copyright © 2016年 IT. All rights reserved.
//

#import "ViewController.h"

#import "LoginViewController.h"

#import "HttpManager.h"

#import "StatuseModel.h"

@interface ViewController ()<LoginViewControllerDelegate,HttpManagerDelegate>

@property (nonatomic,strong)HttpManager *manager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _manager = [[HttpManager alloc]init];
    _manager.delegate = self;

    
    
}

- (void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    if ([HttpManager isNeedLogin]) {
        
        LoginViewController *loginVC = [[LoginViewController alloc]init];
        
        loginVC.delegate = self;
        
        [self presentViewController:loginVC animated:YES completion:nil];
        
        [loginVC release];
        
    }else{
        
        [_manager getFriendsTimeLine];
    }
}

- (void)didGetAccessToken{
    

    [_manager getFriendsTimeLine];

}

- (void)getFriendsTimeLineWithArr:(NSArray *)array{
    
    for (StatuseModel *status in array) {
        

        NSLog(@"%@---%@",status.text,status.user.name);
        
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    
    self.manager = nil;
    [super dealloc];
}

@end
