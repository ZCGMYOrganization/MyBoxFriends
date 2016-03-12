//
//  HttpManager.m
//  AFNetWorkingDemo0119
//
//  Created by wangning on 16/1/19.
//  Copyright © 2016年 IT. All rights reserved.
//

#import "HttpManager.h"

#import "AFNetworking.h"

@implementation HttpManager


+ (void)requestWeatherSuccess:(void(^)(id responseObject))success
                      failure:(void(^)(NSError*error))failure{
    
    NSString *string = @"http://wthrcdn.etouch.cn/weather_mini?city=北京";
    
    NSString *urlString = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    
    [manager GET:urlString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if (success) {
            success(responseObject);
        }
        
//        NSLog(@"%@",responseObject);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
//        NSLog(@"%@",error);
        
        if (failure) {
            failure(error);
        }
        
    }];

    
    
}

@end
