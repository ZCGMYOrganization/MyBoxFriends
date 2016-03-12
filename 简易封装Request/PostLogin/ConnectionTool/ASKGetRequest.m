//
//  ASKGetRequest.m
//  RequestDemo
//
//  Created by Mac on 15/9/8.
//  Copyright (c) 2015年 罗炜翔. All rights reserved.
//

#import "ASKGetRequest.h"

@interface ASKGetRequest ()<NSURLConnectionDataDelegate>{
    
    NSMutableData       *_data;
}

@end



@implementation ASKGetRequest


- (void)dealloc{
    
    self.urlString = nil;
    
    self.responseString = nil;
    
    self.responseData = nil;
    
    [_data release];
    
    [super dealloc];
}




- (instancetype)initWithURLString:(NSString *)urlString delegate:(id)delegate{
    
    if (self = [super init]) {
        
        self.urlString = urlString;
        
        self.delegate = delegate;
        
        self.timeOutSecond = 30;
        
    }
    
    return  self;

    
}


- (instancetype)initWithURLString:(NSString *)urlString{
    
    
    return [self initWithURLString:urlString delegate:nil];
}





- (instancetype)init{
    
    return [self initWithURLString:nil delegate:nil];
    
}

+ (instancetype)requestWithURLString:(NSString *)urlString delegate:(id)delegate{
    
    return [[[self alloc] initWithURLString:urlString delegate:delegate] autorelease];
    
}

+ (instancetype)requestWithURLString:(NSString *)urlString{
    
    return [self requestWithURLString:urlString delegate:nil];
}


+ (instancetype)request{
    
    return [self requestWithURLString:nil delegate:nil];
}



- (void)startAsynchronousRequest{
    
    NSURL *url = [NSURL URLWithString:self.urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:self.timeOutSecond];
    
    [NSURLConnection connectionWithRequest:request delegate:self];
    
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    
    
    
    if ([self.delegate respondsToSelector:@selector(request:didFailWithError:)]) {
        
        
        [self.delegate request:self didFailWithError:error];
    }
    
    
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    
    if (!_data) {
        
        _data = [[NSMutableData alloc] init];
    
    }else{
        
        [_data setData:nil];
        
    }
    
    
    
    if ([self.delegate respondsToSelector:@selector(request:didReceiveResponse:)]) {
        
        [self.delegate request:self didReceiveResponse:response];
        
    }
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    
    [_data appendData:data];
    
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    self.responseData = _data;
    
    self.responseString = [[NSString alloc] initWithData:_data encoding:NSUTF8StringEncoding];
    
    
    if ([self.delegate respondsToSelector:@selector(requestDidFinishLoading:withResponseData:)]) {
        
        [self.delegate requestDidFinishLoading:self withResponseData:self.responseData];
    }
    
}





@end
