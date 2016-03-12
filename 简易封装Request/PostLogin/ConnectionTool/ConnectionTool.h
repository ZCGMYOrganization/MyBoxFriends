//
//  ConnectionTool.h
//  PostLogin
//
//  Created by Mac on 15/9/7.
//  Copyright (c) 2015年 罗炜翔. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ConnectionTool;

@protocol SendMessageDelegate <NSObject>

@required

- (void)getMessage:(id)data;

@optional

- (void)requestDidFailWith:(ConnectionTool *)tool;

- (void)requestDidStart:(ConnectionTool *)tool;



@end

@interface ConnectionTool : NSObject{
    id<SendMessageDelegate> _delegate;
    
    
    
    
}

@property (nonatomic,assign) id<SendMessageDelegate> delegate;

@property (nonatomic, retain) NSError      *error;

@property (nonatomic, copy) NSString       *urlString;

@property (nonatomic, retain) NSDictionary   *responseAllHeaderFields;

@property (nonatomic, assign) NSInteger   responseStatusCode;

@property (nonatomic, assign) NSInteger   timeOutSecond;

@property (nonatomic, copy) NSString      *responseString;

+ (instancetype)connectionWithMethod:(NSString *)method WithWithParameter:(NSString *)str;

- (instancetype)initWithMethod:(NSString *)method WithParameter:(NSString *)str;

- (void)connectionWitGetMethodWithParameter:(NSString *)str;

- (void)connectionWitPostMethodWithParameter:(NSString *)str;


@end
