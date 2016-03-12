//
//  ViewController.m
//  GCDDemo0120
//
//  Created by wangning on 16/1/20.
//  Copyright © 2016年 IT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    GCD    grand 宏大的    Central 中央    dispatch 调度
    
//    用来处理多线程   轻量级的
    
//    1 串行队列
//    dispatch_queue_create 该函数有两个参数
    
//    第一个参数： 该队列的一个标识
//    第二个参数： 用来描述该队列
    
//    串行队列都是顺序执行的
    
//    NSThread
    
//    @"";
    
//    dispatch_queue_t queue = dispatch_queue_create("com.hhzwhh", DISPATCH_QUEUE_SERIAL);
////    再该队列执行任务
//    dispatch_async(queue, ^{
//        
//        [NSThread sleepForTimeInterval:3];
//        
//        NSLog(@"%d",[NSThread isMainThread]);
//        
//        NSLog(@"任务一被执行了");
//        
//    });
//    
//    dispatch_async(queue, ^{
//        
//        [NSThread sleepForTimeInterval:1];
//        NSLog(@"任务二被执行了");
//        
//    });
//    
//    dispatch_async(queue, ^{
//        
//        [NSThread sleepForTimeInterval:2];
//        NSLog(@"任务三被执行了");
//        
//    });
    
    
//    [NSRunLoop currentRunLoop]addTimer:<#(nonnull NSTimer *)#> forMode:<#(nonnull NSString *)#>
    
    
//    [NSThread detachNewThreadSelector:@selector(test) toTarget:self withObject:nil];
    
    
//    2  并行队列
    
//    并行队列 不需要创建 直接获取到
    
//    也有两个参数
//    第一个参数  标识 该队列的一个优先级
    
//    并行队列 同时执行
    
//    时间片：微观角度上来看  分成一片一片的
    
//    并发量：宏观角度 同时执行的任务量
    
//    dispatch_queue_t queue1 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    
//    dispatch_async(queue1, ^{
//        
//        NSLog(@"%d",[NSThread isMainThread]);
//        
//        [NSThread sleepForTimeInterval:2];
//        NSLog(@"任务一被执行了");
//        
//    });
//    
//    dispatch_async(queue1, ^{
//        
//        [NSThread sleepForTimeInterval:1];
//        NSLog(@"任务二被执行了");
//    });
//    
////    __block int a = 0;
//    
//    dispatch_async(queue1, ^{
//        
////        
////        a = 10;
//        
//        [NSThread sleepForTimeInterval:0];
//        NSLog(@"任务三被执行了");
//    });
//    
//    
////    当使用全局的block的时候  需要注意 对self  进行处理
//    
////    __block ViewController *vc = self;
////    
////    
////    __weak __typeof(self) weakSelf = self;
//    
//    [self setBlock:^{
//        
//        
////        self
////        weakSelf
//        
////        vc 
//        
//        
//        NSString *string = @"123";
//        
//    }];
    
    
//    3 主线程队列
    
//    dispatch_queue_t queue2 = dispatch_get_main_queue();
//    
//    dispatch_async(queue2, ^{
//        
//        NSLog(@"%d",[NSThread isMainThread]);
//        
//    });
    
    
    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//
//        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@""]];
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            
//            imageView.image = [UIImage imageWithData:data];
//            
//        });
//        
//        
//    });
    
    
    
    
    
    
    
    

}

- (void)test{
    
    NSLog(@"----%d",[NSThread isMainThread]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
