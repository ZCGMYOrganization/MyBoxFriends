//
//  StatuseModel.m
//  SinaSecondDayDemo0114
//
//  Created by wangning on 16/1/14.
//  Copyright © 2016年 IT. All rights reserved.
//

#import "StatuseModel.h"

@implementation StatuseModel

- (instancetype)initWithDic:(NSDictionary*)dic{
    self = [super init];
    if (self) {
        
        self.text = dic[@"text"];
        self.source = dic[@"source"];
        
        self.user = [UserModel modelWithDic:dic[@"user"]];
        
    }
    return self;

}

+ (instancetype)modelWithDic:(NSDictionary*)dic{
    
    return [[[self alloc]initWithDic:dic]autorelease];
}



- (void)dealloc{
    
    self.user = nil;
    self.text = nil;
    self.source = nil;
    [super dealloc];
}

@end

@implementation UserModel

- (instancetype)initWithDic:(NSDictionary*)dic{
    self = [super init];
    if (self) {
        
        self.name = dic[@"name"];
        self.profile_image_url = dic[@"profile_image_url"];
        
    }
    return self;
    
}

+ (instancetype)modelWithDic:(NSDictionary*)dic{
    
    return [[[self alloc]initWithDic:dic]autorelease];
}



- (void)dealloc{
    self.name = nil;
    self.profile_image_url = nil;
    
    [super dealloc];
    
}

@end
