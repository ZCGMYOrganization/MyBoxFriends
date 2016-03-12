//
//  HttpManager.m
//  BlockDemo0120
//
//  Created by wangning on 16/1/20.
//  Copyright © 2016年 IT. All rights reserved.
//

#import "HttpManager.h"

#import "AFNetworking.h"

@implementation HttpManager

+ (void)requestRegistWithParameters:(NSDictionary*)parameters
                            success:(void(^)(id))success
                               fail:(void(^)(NSError*))fail{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    [manager POST:@"http://172.16.11.232:8080/st/s" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if (success) {
            success(responseObject);
        }

    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        if (fail) {
            fail(error);
        }
        
    }];

}

+ (void)requestLoginWithParameters:(NSDictionary*)parameters
                           success:(void(^)(id))success
                              fail:(void(^)(NSError*))fail{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    [manager POST:@"http://172.16.11.232:8080/st/s" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if (success) {
            success(responseObject);
        }
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        if (fail) {
            fail(error);
        }
        
    }];

    

}

+ (void)requestTestWithParameters:(NSDictionary*)parameters
                          success:(void(^)(id responseObject))success
                             fail:(void(^)(NSError*error))fail{
    
    
    
}

@end
