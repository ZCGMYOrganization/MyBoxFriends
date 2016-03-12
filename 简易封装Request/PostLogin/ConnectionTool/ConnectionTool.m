//
//  ConnectionTool.m
//  PostLogin
//
//  Created by Mac on 15/9/7.
//  Copyright (c) 2015年 罗炜翔. All rights reserved.
//


//get请求 四部
 
//post请求
 
//     1.创建一个string
//     NSString *str = @"http://192.168.10.43:8080/st/s";
// 
//     2.创建一个url
//     NSURL *url = [NSURL URLWithString:str];
// 
//     3.创建一个nsmutableurlrequest
//     NSMutableURLRequest *requst = [NSMutableURLRequest requestWithURL:url];
// 
//     4.设置requet的请求参数
//     [requst setHTTPMethod:@"POST"];
// 
//     NSString *data = @"command=ST_L&name=12&psw=12";
// 
//     [requst setHTTPBody:[data dataUsingEncoding:NSUTF8StringEncoding]];
// 
// 
//     5.创建一个NSURLCONNECTION
//     [NSURLConnection connectionWithRequest:requst delegate:self];



#import "ConnectionTool.h"

#define BASEURL @"http://192.168.10.43:8080/st/s"



@interface ConnectionTool ()<NSURLConnectionDataDelegate>{
    
    
    NSMutableData *__data;

    
}


@end



@implementation ConnectionTool

- (void)dealloc{
    
    
    
    [__data release];
    
    self.urlString = nil;
    
    self.error = nil;
    
    self.responseAllHeaderFields = nil;
    
    [super dealloc];
}




- (instancetype)initWithMethod:(NSString *)method WithParameter:(NSString *)str{
    
    if (self = [super init]) {
        
        
        
        if ([method isEqualToString:@"POST"]) {
            
            [self connectionWitPostMethodWithParameter:str];
            
        }else if ([method isEqualToString:@"GET"]){
            
            [self connectionWitGetMethodWithParameter:str];
            
            
        }
    }
    
    return self;
}


+ (instancetype)connectionWithMethod:(NSString *)method WithWithParameter:(NSString *)str{
    
    return [[[self alloc] initWithMethod:method WithParameter:str] autorelease];
}


- (void)connectionWitPostMethodWithParameter:(NSString *)str{
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:BASEURL]];
    
    [request setHTTPMethod:@"POST"];
    
    [request setHTTPBody:[str dataUsingEncoding:NSUTF8StringEncoding]];
    
    [NSURLConnection connectionWithRequest:request delegate:self];
    
    
    
}



- (void)connectionWitGetMethodWithParameter:(NSString *)str{
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@?%@",BASEURL,str]]];
    
    [request setHTTPMethod:@"GET"];
    
    [NSURLConnection connectionWithRequest:request delegate:self];
    
    
    
}





- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    
    NSLog(@"%@",error);
    
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    
    if (!__data) {
        __data = [[NSMutableData alloc] init];
        
    }else{
        
        [__data setData:nil];
        
    }
}



- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    
    [__data appendData:data];
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:__data options:NSJSONReadingMutableContainers error:nil];
    

    
    if (dic) {
        
        if ([_delegate respondsToSelector:@selector(getMessage:)]) {
            [self.delegate getMessage:dic];
            
        }
    }
    

}




@end
