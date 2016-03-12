//
//  ITOperation.m
//  NSOprerationQueueDemo0122
//
//  Created by wangning on 16/1/22.
//  Copyright © 2016年 IT. All rights reserved.
//

#import "ITOperation.h"

@interface ITOperation ()

@property (nonatomic,copy)NSString *urlString;

@property (nonatomic,strong)UIImageView *imageView;

@end

@implementation ITOperation

- (id)initWithURLString:(NSString*)urlString imageView:(UIImageView*)imageView{
    
    self = [super init];
    if (self) {
      
        self.urlString = urlString;
        self.imageView = imageView;
    }
    return self;
}

+ (id)operationWithURLString:(NSString*)urlString imageView:(UIImageView*)imageView{
    
    return [[[self alloc]initWithURLString:urlString imageView:imageView]autorelease];
}

- (void)main{

    NSLog(@"%d",[NSThread isMainThread]);
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.urlString]];
    
    
    UIImage *image = [UIImage imageWithData:data];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        
        self.imageView.image = image;
        
    });
    
    
    
}


- (void)dealloc{
    
    self.urlString = nil;
    self.imageView = nil;
    [super dealloc];
}

@end
