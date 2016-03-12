//
//  StatuseModel.m
//  BlockSinaDemo0119
//
//  Created by wangning on 16/1/19.
//  Copyright © 2016年 IT. All rights reserved.
//

#import "StatuseModel.h"
#import "GDataXML/GDataXMLNode.h"

@implementation StatuseModel

- (id)initWithDic:(NSDictionary*)dic{
    self = [super init];
    if (self) {
        
        self.text = dic[@"text"];
        self.source = [SouceModel modelWithStr:dic[@"source"]];
        self.user = [UserModel modelWithDic:dic[@"user"]];
    }
    return self;
    
}
+ (id)modelWithDic:(NSDictionary*)dic{
    
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
- (id)initWithDic:(NSDictionary*)dic{
    self = [super init];
    if (self) {
        
        self.name = dic[@"name"];
        self.profile_image_url = dic[@"profile_image_url"];
    }
    return self;
    
}
+ (id)modelWithDic:(NSDictionary*)dic{
    
    return [[[self alloc]initWithDic:dic]autorelease];
}

- (void)dealloc{
    
    self.name = nil;
    self.profile_image_url = nil;
    [super dealloc];
}



@end

@implementation SouceModel

- (id)initWithStr:(NSString*)string{
    
    self = [super init];
    if (self) {
       
        GDataXMLDocument *doc = [[GDataXMLDocument alloc]initWithXMLString:string error:nil];
        
        NSArray *array = [doc nodesForXPath:@"//a" error:nil];
        
        GDataXMLElement *element = [array lastObject];
        
        self.content = element.stringValue;
        
        self.href = [[element attributeForName:@"href"] stringValue];
        
        [doc release];
        
        
    }
    return self;
    
}
+ (id)modelWithStr:(NSString*)string{
    
    return [[[self alloc]initWithStr:string]autorelease];
    
}


- (void)dealloc{
    
    self.content = nil;
    self.href = nil;
    [super dealloc];
}

@end
