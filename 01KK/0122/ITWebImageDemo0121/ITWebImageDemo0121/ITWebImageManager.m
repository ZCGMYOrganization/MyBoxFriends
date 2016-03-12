//
//  ITWebImageManager.m
//  ITWebImageDemo0121
//
//  Created by wangning on 16/1/21.
//  Copyright © 2016年 IT. All rights reserved.
//

#import "ITWebImageManager.h"
#import "NSString+Addition.h"
#import "NSString+MD5.h"


static ITWebImageManager *manager = nil;

@interface ITWebImageManager ()

@property (nonatomic,strong)NSMutableDictionary *imageCaches;

@end

@implementation ITWebImageManager


- (id)init{
    
    self = [super init];
    if (self) {
       
//        self.imageCaches = [NSMutableDictionary dictionary];
        
        
//        UIApplicationDidEnterBackgroundNotification
        
        
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(clearData) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
        
        
    }
    return self;
}

- (void)clearData{
    
    
    if (self.imageCaches) {
       
        [self.imageCaches removeAllObjects];
    }
    
}

+ (id)shareManager{
  
    @synchronized(self) {
        
        if (!manager) {
            manager = [[self alloc]init];
        }
    }
    return manager;
}

- (NSMutableDictionary*)imageCaches{
    
    if (!_imageCaches) {
        
        _imageCaches = [NSMutableDictionary dictionary];

    }
    
    return _imageCaches;
    
}

- (UIImage*)getCachesImageWithKey:(NSString*)key{
    
    UIImage *image = [self.imageCaches objectForKey:key];
    
    return image;
}

- (UIImage*)getLocalImageWithPath:(NSString*)path{
    
//    http://www.baidu.com/1.jpg
//    此时不能直接去使用urlString作为文件名，因为会创建多余的文件夹，所以进行MD5加密 作为文件名
    
    NSData *data = [NSData dataWithContentsOfFile:[NSString getFileWithPath:[NSString stringWithFormat:@"imageCaches/%@", [path MD5Hash]]]];
    
    UIImage *image = [UIImage imageWithData:data];
    
    if (image) {
        
        [self.imageCaches setObject:image forKey:path];
    }
    
    return image;

}

- (void)downloadImageWithURLString:(NSString*)urlString imageView:(UIImageView*)imageView{
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
        
        UIImage *image = [UIImage imageWithData:data];
        
        if (image) {
            
            [self.imageCaches setObject:image forKey:urlString];
            
            
            [data writeToFile:[NSString getFileWithPath:[NSString stringWithFormat:@"imageCaches/%@",[urlString MD5Hash]]] atomically:YES];
            
            
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            
            imageView.image = image;
            
        });
        
        
        
        
    });
    
    
    
    
}

@end
