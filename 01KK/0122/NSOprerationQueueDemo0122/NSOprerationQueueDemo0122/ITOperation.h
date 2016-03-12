//
//  ITOperation.h
//  NSOprerationQueueDemo0122
//
//  Created by wangning on 16/1/22.
//  Copyright © 2016年 IT. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

//    操作队列中追加操作  用的是NSOperation 但是  该类是一个虚类  不能直接使用

// 在该操作对象中   相对应的操作  只需要重写main方法即可

@interface ITOperation : NSOperation

- (id)initWithURLString:(NSString*)urlString imageView:(UIImageView*)imageView;

+ (id)operationWithURLString:(NSString*)urlString imageView:(UIImageView*)imageView;

@end
