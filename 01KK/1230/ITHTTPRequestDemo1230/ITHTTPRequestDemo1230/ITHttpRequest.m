//
//  ITHttpRequest.m
//  ITHTTPRequestDemo1230
//
//  Created by wangning on 15/12/30.
//  Copyright © 2015年 IT. All rights reserved.
//

#import "ITHttpRequest.h"

@implementation ITHttpRequest
- (id)initWithURLString:(NSString*)urlString withDelegate:(id)del{
        
    self = [super init];
    if (self) {
       
        self.delegate = del;
        self.urlString = urlString;
//        设置一个初始的超时时间  如果外部没有设置   就默认30秒
        self.timeOutSecond = 30;
    }
    return self;

}

+ (id)requestWithURLString:(NSString*)urlString withDelegate:(id)del{
    
    return [[[self alloc]initWithURLString:urlString withDelegate:del]autorelease];
    
}


- (void)startRequest{
    
//    1 创建urlString 可以省略  初始化的时候传过来了
    
//    2 根据urlString 生成url
    NSURL *url = [NSURL URLWithString:self.urlString];
//    3 创建request
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:self.timeOutSecond];
//    4 发送链接
    [NSURLConnection connectionWithRequest:request delegate:self];
    
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    
    _responseData = [[NSMutableData data] retain];
    
    NSHTTPURLResponse *res = (NSHTTPURLResponse*)response;
    
    self.responseHeaders = res.allHeaderFields;
    
    self.statusCode = res.statusCode;
    
    
    if ([self.delegate respondsToSelector:@selector(requestDidStart:)]) {
        
        [self.delegate requestDidStart:self];
    }
    
    
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    
    [_responseData appendData:data];
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    
    _responseString = [[NSString alloc]initWithData:self.responseData encoding:NSUTF8StringEncoding];
    
    
    if ([self.delegate respondsToSelector:@selector(requestDidFinished:)]) {

        [self.delegate requestDidFinished:self];
        
    }
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    
    self.error = error;
    
    if ([self.delegate respondsToSelector:@selector(requestDidFail:)]) {
        
        
        [self.delegate requestDidFail:self];
        
    }
    
    
    
}


- (void)dealloc{
    [_error release];
    [_responseHeaders release];
    [_responseString release];
    [_responseData release];
    [_urlString release];
    [super dealloc];
}





@end
