//
//  StatuseModel.h
//  SinaSecondDayDemo0114
//
//  Created by wangning on 16/1/14.
//  Copyright © 2016年 IT. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UserModel;

@interface StatuseModel : NSObject

@property (nonatomic,copy)NSString *text;
@property (nonatomic,copy)NSString *source;
@property (nonatomic,strong)UserModel *user;


- (instancetype)initWithDic:(NSDictionary*)dic;

+ (instancetype)modelWithDic:(NSDictionary*)dic;

@end

@interface UserModel : NSObject

@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *profile_image_url;

- (instancetype)initWithDic:(NSDictionary*)dic;

+ (instancetype)modelWithDic:(NSDictionary*)dic;

@end
