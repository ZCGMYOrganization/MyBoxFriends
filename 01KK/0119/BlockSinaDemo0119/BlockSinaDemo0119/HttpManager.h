//
//  HttpManager.h
//  BlockSinaDemo0119
//
//  Created by wangning on 16/1/19.
//  Copyright © 2016年 IT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpManager : NSObject

+ (NSURL*)loginURL;

+ (BOOL)isLogin;

+ (void)getAccessTokenWithCode:(NSString*)code
                    completion:(void(^)())completion;

+ (void)getFriendsTimeLineWithBlock:(void(^)(NSArray*))completion;


@end
