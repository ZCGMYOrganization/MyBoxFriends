//
//  NSString+Addition.m
//  CategoryDemo0107
//
//  Created by wangning on 16/1/7.
//  Copyright © 2016年 IT. All rights reserved.
//

#import "NSString+Addition.h"

@implementation NSString (Addition)

+ (NSString*)getSandBoxPath{
    
    return NSHomeDirectory();
}

+ (NSString*)getDocumentsPath{
    
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
}

+ (NSString*)getDirectoryPathWithPath:(NSString*)path{
    
//    拼接出来完整的路径
    NSString *finalPath = [[self getDocumentsPath] stringByAppendingPathComponent:path];
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    if (![manager fileExistsAtPath:finalPath]) {
        
        [manager createDirectoryAtPath:finalPath withIntermediateDirectories:YES attributes:nil error:nil];
        
    }
    return finalPath;
}

//该方法 文件夹与文件名无法重名  不可取

//+ (NSString*)getFilePathWithPath:(NSString*)path{
//    
////    g/g/g
//    
////    d/e/f/
//    
//    NSString *fileName = [[path componentsSeparatedByString:@"/"] lastObject];
//    
//    NSString *directoryPath = [path stringByReplacingOccurrencesOfString:fileName withString:@""];
//    
//    NSString *finalDirectoryPath = [self getDirectoryPathWithPath:directoryPath];
//    
//    NSString *finalFilePath = [finalDirectoryPath stringByAppendingPathComponent:fileName];
//    
//    NSFileManager *manager = [NSFileManager defaultManager];
//    
//    if (![manager fileExistsAtPath:finalFilePath]) {
//        
//        [manager createFileAtPath:finalFilePath contents:nil attributes:nil];
//        
//    }
//    return finalFilePath;
//}

+ (NSString*)getFilePathWithPath:(NSString *)path{
    
//    d/e/f/
//    g/g/g/g
    NSArray *array = [path componentsSeparatedByString:@"/"];
    
    NSMutableArray *arr = [NSMutableArray arrayWithArray:array];
    
    [arr removeObject:@""];
    //g
    NSString *fileName = [arr lastObject];
    //
    NSRange range = [path rangeOfString:fileName options:NSBackwardsSearch];
    //
    NSString *directoryPath = [path stringByReplacingCharactersInRange:range withString:@""];
    
    NSString *finalDirectoryPath = [self getDirectoryPathWithPath:directoryPath];
    
    NSString *finalFilePath = [finalDirectoryPath stringByAppendingPathComponent:fileName];
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    if (![manager fileExistsAtPath:finalFilePath]) {
        
        [manager createFileAtPath:finalFilePath contents:nil attributes:nil];
        
    }
    
    return finalFilePath;
}

@end
