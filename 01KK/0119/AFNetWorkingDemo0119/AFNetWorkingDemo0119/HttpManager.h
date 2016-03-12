//
//  HttpManager.h
//  AFNetWorkingDemo0119
//
//  Created by wangning on 16/1/19.
//  Copyright © 2016年 IT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpManager : NSObject

+ (void)requestWeatherSuccess:(void(^)(id responseObject))success
                      failure:(void(^)(NSError*error))failure;

@end
