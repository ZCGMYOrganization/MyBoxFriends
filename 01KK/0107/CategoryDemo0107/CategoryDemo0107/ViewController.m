//
//  ViewController.m
//  CategoryDemo0107
//
//  Created by wangning on 16/1/7.
//  Copyright © 2016年 IT. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Addition.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

//  1获取沙盒路径
//    NSString *sandBoxString = [NSString getSandBoxPath];
//    
//    NSLog(@"%@",sandBoxString);
    
    // 2  a/b/c
    
//    NSString *directoryPath = [NSString getDirectoryPathWithPath:@"a/b/c"];
//    
//    NSLog(@"%@",directoryPath);
    
    //3  d/e/f
    
    [NSString getFilePathWithPath:@"d/e/f"];
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
