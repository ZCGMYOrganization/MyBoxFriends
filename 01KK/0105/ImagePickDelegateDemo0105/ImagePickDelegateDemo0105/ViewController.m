//
//  ViewController.m
//  ImagePickDelegateDemo0105
//
//  Created by wangning on 16/1/5.
//  Copyright © 2016年 IT. All rights reserved.
//

#import "ViewController.h"

#import "CustoView.h"

@interface ViewController ()<CustoViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CustoView *view = [[CustoView alloc]initWithFrame:self.view.frame];
    
    view.delegate = self;
    
    [self.view addSubview:view];
    
    [view release];
    
}

- (void)funcA{
    NSLog(@"%s",__FUNCTION__);
}

- (void)funcB{
    
    NSLog(@"%s",__FUNCTION__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
