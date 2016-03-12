//
//  UIImageView+WebCaches.m
//  ITWebImageDemo0121
//
//  Created by wangning on 16/1/21.
//  Copyright © 2016年 IT. All rights reserved.
//

#import "UIImageView+WebCaches.h"
#import "ITWebImageManager.h"

@implementation UIImageView (WebCaches)

- (void)it_setImageWithUrlString:(NSString*)urlString{
    
    UIImage *image = nil;
    
//    1 从缓存中去取
    
    ITWebImageManager *manager = [ITWebImageManager shareManager];
    
    image = [manager getCachesImageWithKey:urlString];
    
    if (image) {
        
        self.image = image;
        return;
    }
    
//   2 如果缓存中没有取到该图片，要从本地中去取
    
    image = [manager getLocalImageWithPath:urlString];
    
    if (image) {
        self.image = image;
        return;
    }
    
//   3 缓存 本地都没有取到该图片  需要下载。
    
    
    [manager downloadImageWithURLString:urlString imageView:self];

}
- (void)it_setImageWithUrlString:(NSString *)urlString placeHolderImage:(UIImage*)image{
    
    self.image = image;
    
    [self it_setImageWithUrlString:urlString];
    
}

@end
