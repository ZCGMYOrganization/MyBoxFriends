//
//  HttpManager.h
//  SinaSecondDayDemo0114
//
//  Created by wangning on 16/1/14.
//  Copyright © 2016年 IT. All rights reserved.
//

#import <Foundation/Foundation.h>



typedef NS_ENUM(NSInteger,RequestType){
    
    RequestTypeGetAccessToken = 1,
    RequestTypeGetFriendsTimeline,
    
};


@protocol HttpManagerDelegate <NSObject>

@optional
- (void)getAccesstoknSuccess;


- (void)getFriendsTimeLineWithArr:(NSArray*)array;

@end




@interface HttpManager : NSObject

@property (nonatomic,assign)id delegate;

//登陆页面的URL
+ (NSURL*)loginURL;

//请求accessToken
- (void)getAccessTokenWithCode:(NSString*)code;

//判断是否需要登陆
+ (BOOL)isNeedLogin;

//获取当前登录用户及其所关注（授权）用户的最新微博
- (void)getFriendsTimeLine;



@end
