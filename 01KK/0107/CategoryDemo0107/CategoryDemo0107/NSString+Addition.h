//
//  NSString+Addition.h
//  CategoryDemo0107
//
//  Created by wangning on 16/1/7.
//  Copyright © 2016年 IT. All rights reserved.
//

#import <Foundation/Foundation.h>

//类别中可以扩充实例方法   也可以扩充类方法
@interface NSString (Addition)

//获取沙盒路径
+ (NSString*)getSandBoxPath;

//获取Documents路径
+ (NSString*)getDocumentsPath;

//获取某个文件夹的路径
+ (NSString*)getDirectoryPathWithPath:(NSString*)path;

//获取某个文件的路径
+ (NSString*)getFilePathWithPath:(NSString*)path;



@end
