//
//  ITHttpRequest.h
//  ITHTTPRequestDemo1230
//
//  Created by wangning on 15/12/30.
//  Copyright © 2015年 IT. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ITHttpRequest;
@protocol ITHttpRequestDelegate <NSObject>

@optional

- (void)requestDidStart:(ITHttpRequest*)request;

- (void)requestDidFinished:(ITHttpRequest*)request;

- (void)requestDidFail:(ITHttpRequest*)request;


@end



@interface ITHttpRequest : NSObject<NSURLConnectionDataDelegate>
//发Get请求  唯一的不同就是urlString的不同  我们可以单独写一个类处理这些操作，只需要把urlString传进来即可

@property (nonatomic,assign)NSInteger timeOutSecond;

@property (nonatomic,strong)NSError *error;

@property (nonatomic,strong)NSDictionary *responseHeaders;

@property (nonatomic,assign)NSInteger statusCode;

@property (nonatomic,copy,readonly)NSString *responseString;

@property (nonatomic,assign)id<ITHttpRequestDelegate> delegate;

@property (nonatomic,strong,readonly)NSMutableData *responseData;

@property (nonatomic,copy)NSString *urlString;

- (id)initWithURLString:(NSString*)urlString withDelegate:(id)del;

+ (id)requestWithURLString:(NSString*)urlString withDelegate:(id)del;

//发起请求
- (void)startRequest;


@end
