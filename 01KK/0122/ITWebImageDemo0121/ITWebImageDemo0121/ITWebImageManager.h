//
//  ITWebImageManager.h
//  ITWebImageDemo0121
//
//  Created by wangning on 16/1/21.
//  Copyright © 2016年 IT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ITWebImageManager : NSObject

+ (id)shareManager;

//从缓存中取出图片的方法
- (UIImage*)getCachesImageWithKey:(NSString*)key;
//从本地取出图片
- (UIImage*)getLocalImageWithPath:(NSString*)path;

// 下载该图片
- (void)downloadImageWithURLString:(NSString*)urlString imageView:(UIImageView*)imageView;


@end
