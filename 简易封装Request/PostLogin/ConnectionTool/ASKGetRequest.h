//
//  ASKGetRequest.h
//  RequestDemo
//
//  Created by Mac on 15/9/8.
//  Copyright (c) 2015年 罗炜翔. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ASKGetRequestDelegate;

@interface ASKGetRequest : NSObject






@property (nonatomic, copy) NSString             *urlString;
@property (nonatomic, assign) NSInteger          timeOutSecond;
@property (nonatomic, retain) NSData             *responseData;
@property (nonatomic, copy) NSString             *responseString;

@property (nonatomic, assign) id<ASKGetRequestDelegate> delegate;




- (instancetype)init;
- (instancetype)initWithURLString:(NSString *)urlString;
- (instancetype)initWithURLString:(NSString *)urlString delegate:(id)delegate;
+ (instancetype)requestWithURLString:(NSString *)urlString delegate:(id)delegate;
+ (instancetype)requestWithURLString:(NSString *)urlString;
+ (instancetype)request;
- (void)startAsynchronousRequest;


@end



@protocol ASKGetRequestDelegate <NSObject>

@optional

- (void)request:(ASKGetRequest *)request didFailWithError:(NSError *)error;
- (void)request:(ASKGetRequest *)request didReceiveResponse:(NSURLResponse *)response;

@required
- (void)requestDidFinishLoading:(ASKGetRequest *)request withResponseData:(NSData *)data;

@end

