//
//  ViewController.m
//  AFNetWorkingDemo0119
//
//  Created by wangning on 16/1/19.
//  Copyright © 2016年 IT. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

#import "HttpManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    
//    NSString *string = @"http://wthrcdn.etouch.cn/weather_mini?city=北京";
//    
//    NSString *urlString = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    
////    manager.requestSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
//    
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
//    
//    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSDictionary *dic = (NSDictionary*)responseObject;
//        
//        NSLog(@"----%@",responseObject);
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//        NSLog(@"%@",error);
//        
//    }];
    
    
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
//    
//    [manager GET:urlString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
//        
//        NSLog(@"%@",responseObject);
//        
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        
//        NSLog(@"%@",error);
//        
//    }];
    
    
    
    [HttpManager requestWeatherSuccess:^(id responseObject) {
        
        NSLog(@"%@",responseObject);
        
    } failure:^(NSError *error) {
        
    }];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
