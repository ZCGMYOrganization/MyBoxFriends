//
//  ASKPostRequest.h
//  RequestDemo
//
//  Created by Mac on 15/9/8.
//  Copyright (c) 2015年 罗炜翔. All rights reserved.
//

#import "ASKGetRequest.h"

@interface ASKPostRequest : ASKGetRequest


@property (nonatomic, retain) NSData    *requestData;
@property (nonatomic, retain) NSMutableDictionary   *requestDic;


- (void)addValue:(NSString *)value forKey:(NSString *)key;
- (void)startAsynchronousRequest;


@end
