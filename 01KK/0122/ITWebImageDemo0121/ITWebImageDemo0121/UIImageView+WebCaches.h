//
//  UIImageView+WebCaches.h
//  ITWebImageDemo0121
//
//  Created by wangning on 16/1/21.
//  Copyright © 2016年 IT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (WebCaches)

- (void)it_setImageWithUrlString:(NSString*)urlString;

- (void)it_setImageWithUrlString:(NSString *)urlString placeHolderImage:(UIImage*)image;

@end
