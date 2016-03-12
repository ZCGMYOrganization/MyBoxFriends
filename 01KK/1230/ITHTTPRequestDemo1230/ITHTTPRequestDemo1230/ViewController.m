//
//  ViewController.m
//  ITHTTPRequestDemo1230
//
//  Created by wangning on 15/12/30.
//  Copyright © 2015年 IT. All rights reserved.
//

#import "ViewController.h"

#import "ITHttpRequest.h"

@interface ViewController ()<ITHttpRequestDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    ITHttpRequest *request = [ITHttpRequest requestWithURLString:@"http://www.baidu.com" withDelegate:self];
//    request.timeOutSecond = 30;

    [request startRequest];
    
    
    
  
      
//    [self testFunc:@""];
}

//- (void)testFunc:(NSString*)str{
//    
//}


- (void)requestDidStart:(ITHttpRequest *)request{
    
    NSLog(@"%@-----%ld",request.responseHeaders,request.statusCode);
    
}

- (void)requestDidFinished:(ITHttpRequest *)request{
    
    NSLog(@"%@",request.responseString);
}

- (void)requestDidFail:(ITHttpRequest *)request{
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
