//
//  StatuseModel.h
//  BlockSinaDemo0119
//
//  Created by wangning on 16/1/19.
//  Copyright © 2016年 IT. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UserModel;
@class SouceModel;
@interface StatuseModel : NSObject

@property (nonatomic,copy)NSString *text;
@property (nonatomic,strong)SouceModel *source;
@property (nonatomic,strong)UserModel *user;

- (id)initWithDic:(NSDictionary*)dic;
+ (id)modelWithDic:(NSDictionary*)dic;


@end

@interface UserModel : NSObject

@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *profile_image_url;

- (id)initWithDic:(NSDictionary*)dic;
+ (id)modelWithDic:(NSDictionary*)dic;

@end

@interface SouceModel : NSObject

@property (nonatomic,copy)NSString *content;
@property (nonatomic,copy)NSString *href;

- (id)initWithStr:(NSString*)string;
+ (id)modelWithStr:(NSString*)string;


@end
