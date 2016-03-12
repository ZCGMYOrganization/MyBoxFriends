//
//  ViewController.m
//  APP1Demo0107
//
//  Created by wangning on 16/1/7.
//  Copyright © 2016年 IT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)buttonClick:(UIButton *)sender {
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"App2Demo://?name=zhangsan&backURL=App1Demo:"]];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
