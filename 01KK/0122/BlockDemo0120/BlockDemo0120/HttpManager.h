//
//  HttpManager.h
//  BlockDemo0120
//
//  Created by wangning on 16/1/20.
//  Copyright © 2016年 IT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpManager : NSObject



+ (void)requestRegistWithParameters:(NSDictionary*)parameters
                            success:(void(^)(id))success
                               fail:(void(^)(NSError*))fail;

+ (void)requestLoginWithParameters:(NSDictionary*)parameters
                           success:(void(^)(id))success
                              fail:(void(^)(NSError*))fail;

+ (void)requestTestWithParameters:(NSDictionary*)parameters
                           success:(void(^)(id responseObject))success
                              fail:(void(^)(NSError*error))fail;





@end
