//
//  ViewController.m
//  NSOprerationQueueDemo0122
//
//  Created by wangning on 16/1/22.
//  Copyright © 2016年 IT. All rights reserved.
//

#import "ViewController.h"
#import "ITOperation.h"

@interface ViewController ()


@property (nonatomic,strong)NSOperationQueue *queue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//   NSOperationQueue  操作队列
    
//    [[NSOperationQueue alloc]init]  相当于开辟了一个分线程
//    具体的操作是在主线程还是分线程  取决于操作队列
//    _queue = [[NSOperationQueue alloc]init];
    
//    获取当前的操作队列
    self.queue = [NSOperationQueue currentQueue];
    
//    self.queue = [NSOperationQueue mainQueue];
    

    
    
}
- (IBAction)buttonClick:(UIButton *)sender {
    
    ITOperation *operation = [ITOperation operationWithURLString:@"" imageView:self.imageView];
    
    [_queue addOperation:operation];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    
    [_queue release];
    [_imageView release];
    [super dealloc];
}
@end
