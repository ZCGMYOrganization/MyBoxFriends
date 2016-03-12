//
//  UIView+A.h
//  CategoryDemo0107
//
//  Created by wangning on 16/1/7.
//  Copyright © 2016年 IT. All rights reserved.
//

#import <UIKit/UIKit.h>


/*
 类别的作用：
 1 私有API
 
 2 分散类的实现  最常见的 NSINdexPath
 
 3 扩充原有类的方法
 
 
 类别：   类别没有创建新的类  轻量级的
 
 继承： 创建了一个新的类  继承原有类的所有属性和方法   重量级的
 
 */


//在类别中重写原来类的方法的时候要慎重！

//@interface  声明  UIView类别  (A) 类别名
@interface UIView (A)

//- (void)addSubview:(UIView *)view;

@end
