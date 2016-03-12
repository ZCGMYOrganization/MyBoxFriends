//
//  ViewController.m
//  NSLockDemo0122
//
//  Created by wangning on 16/1/22.
//  Copyright © 2016年 IT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,assign) NSInteger tickets;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    _tickets = 20;
    
//    注意  三个任务都需要锁上
//    NSLock *lock = [[NSLock alloc]init];
    
//    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        
//        [lock lock];
//        NSLog(@"小明来买票了");
//        if (_tickets >= 10) {
//            
//            NSLog(@"小明可以买票");
//            
////            _tickets = _tickets - 10;
//            
//            _tickets -= 10;
//            
//            NSLog(@"小明买过票了，还剩余%ld",_tickets);
//        }else{
//            
//            NSLog(@"余票不足，小明买不到票，还有%ld",_tickets);
//        }
//        [lock unlock];
//
//    });
//    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        [lock lock];
//        NSLog(@"小红来买票了");
//        if (_tickets >= 7) {
//            
//            NSLog(@"小红可以买票");
//            
//            //            _tickets = _tickets - 10;
//            
//            _tickets -= 7;
//            
//            NSLog(@"小红买过票了，还剩余%ld",_tickets);
//        }else{
//            
//            NSLog(@"余票不足，小红买不到票，还有%ld",_tickets);
//        }
//        
//        [lock unlock];
//        
//    });
//
//    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        
//        [lock lock];
//        NSLog(@"小张来买票了");
//        if (_tickets >= 8) {
//            
//            NSLog(@"小张可以买票");
//            
//            //            _tickets = _tickets - 10;
//            
//            _tickets -= 8;
//            
//            NSLog(@"小张买过票了，还剩余%ld",_tickets);
//        }else{
//            
//            NSLog(@"余票不足，小张买不到票，还有%ld",_tickets);
//        }
//        
//        [lock unlock];
//        
//    });
    
    
//    同步块
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        
//        同步快跟线程锁作用一直  保证某一段代码执行，
        
//        @synchronized （）  括号内可以放任意对象用来标识该同步块      一般直接放self就可以
        
        @synchronized(self) {
            
            NSLog(@"小明来买票了");
            if (_tickets >= 10) {
                
                NSLog(@"小明可以买票");
                
                //            _tickets = _tickets - 10;
                
                _tickets -= 10;
                
                NSLog(@"小明买过票了，还剩余%ld",_tickets);
            }else{
                
                NSLog(@"余票不足，小明买不到票，还有%ld",_tickets);
            }

            
        }
        
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        @synchronized(self) {
            
            
            NSLog(@"小红来买票了");
            if (_tickets >= 7) {
                
                NSLog(@"小红可以买票");
                
                //            _tickets = _tickets - 10;
                
                _tickets -= 7;
                
                NSLog(@"小红买过票了，还剩余%ld",_tickets);
            }else{
                
                NSLog(@"余票不足，小红买不到票，还有%ld",_tickets);
            }

            
        }
        
        
    });
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        
        @synchronized(self) {
            
            
            NSLog(@"小张来买票了");
            if (_tickets >= 8) {
                
                NSLog(@"小张可以买票");
                
                //            _tickets = _tickets - 10;
                
                _tickets -= 8;
                
                NSLog(@"小张买过票了，还剩余%ld",_tickets);
            }else{
                
                NSLog(@"余票不足，小张买不到票，还有%ld",_tickets);
            }

            
        }
        
    });


    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
