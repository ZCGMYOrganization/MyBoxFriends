//
//  ViewController.m
//  SDWebImageDemo0114
//
//  Created by wangning on 16/1/14.
//  Copyright © 2016年 IT. All rights reserved.
//

#import "ViewController.h"

#import "UIImageView+WebCache.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    http://pic14.nipic.com/20110522/7411759_164157418126_2.jpg
    
    
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:@"http://pic14.nipic.com/20110522/7411759_164157418126_2.jpg"]];
//    UIImageView *imageView = nil;
//    
//    [imageView sd_setImageWithURL:[NSURL URLWithString:@""]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
