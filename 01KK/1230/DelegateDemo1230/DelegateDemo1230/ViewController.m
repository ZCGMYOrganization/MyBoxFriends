//
//  ViewController.m
//  DelegateDemo1230
//
//  Created by wangning on 15/12/30.
//  Copyright © 2015年 IT. All rights reserved.
//

#import "ViewController.h"

#import "SecondViewController.h"

@interface ViewController ()<SecondViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)buttonClick:(UIButton *)sender {
    
    
    SecondViewController *secondVC = [[SecondViewController alloc]init];
    
    secondVC.viewController = self;
    
    
    [self presentViewController:secondVC animated:YES completion:nil];
    
    
}

//- (void)changeColor{
//    
//    self.view.backgroundColor = [UIColor redColor];
//    
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
