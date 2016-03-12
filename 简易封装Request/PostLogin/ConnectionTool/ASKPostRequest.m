//
//  ASKPostRequest.m
//  RequestDemo
//
//  Created by Mac on 15/9/8.
//  Copyright (c) 2015年 罗炜翔. All rights reserved.
//

#import "ASKPostRequest.h"

@implementation ASKPostRequest

- (void)dealloc{
    
    self.requestDic = nil;
    
    self.requestData = nil;
    
    [super dealloc];
}

- (void)addValue:(NSString *)value forKey:(NSString *)key{
    
    if (!self.requestDic) {
        
        self.requestDic = [NSMutableDictionary dictionaryWithCapacity:0];
    }
    
    
    [self.requestDic setObject:value forKey:key];
    
}

- (NSData *)getRequestDataFromDictionary{
    
    NSString *string = nil;
    
    NSArray *keyArray = [self.requestDic allKeys];
    
    for (int i = 0; i < keyArray.count; i++) {
        
        NSString *key = keyArray[i];
        
        NSString *value = [self.requestDic objectForKey:key];
        
        if (i == 0) {
            
            string = [NSString stringWithFormat:@"%@=%@",key,value];
            
        }else{
            
            string = [string stringByAppendingString:[NSString stringWithFormat:@"&%@=%@",key,value]];
        }
        
        
    }
    
    return [string dataUsingEncoding:NSUTF8StringEncoding];
    
}


- (void)startAsynchronousRequest{
    
    NSURL *url = [NSURL URLWithString:self.urlString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:self.timeOutSecond];
    
    [request setHTTPMethod:@"POST"];
    
    if (self.requestData) {
        [request setHTTPBody:self.requestData];
    }else if(self.requestDic){
        [request setHTTPBody:[self getRequestDataFromDictionary]];
    }else{
        
        return;
    }
    
    
    
    [NSURLConnection connectionWithRequest:request delegate:self];
    
}



@end
