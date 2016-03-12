//
//  HttpManager.m
//  BlockSinaDemo0119
//
//  Created by wangning on 16/1/19.
//  Copyright © 2016年 IT. All rights reserved.
//

#import "HttpManager.h"

#import "ASIFormDataRequest.h"

#import "StatuseModel.h"

//App Key：2695688670
//App Secret：4db99fceff3c9d64848ecd50373ec00e

#define access_token_key @"access_token"
#define expires_in_key @"expires_in"
#define uid_key @"uid"



@implementation HttpManager

+ (NSURL*)loginURL{
    
    return [NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=2695688670&redirect_uri=http://www.baidu.com"];
    
}

+ (BOOL)isLogin{
    
    NSString *access_token = [[NSUserDefaults standardUserDefaults]objectForKey:access_token_key];
    
    if (!access_token) {
        
        return NO;
    }
    
    NSDate *finalDate = [[NSUserDefaults standardUserDefaults]objectForKey:expires_in_key];
    
    NSDate *nowDate = [NSDate date];
    
    NSComparisonResult result = [nowDate compare:finalDate];
    
    if (result == NSOrderedAscending) {
        
        return YES;
    }
    
    return NO;
}

+ (void)getAccessTokenWithCode:(NSString*)code
                    completion:(void(^)())completion{
    
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:@"https://api.weibo.com/oauth2/access_token"]];
    
    [request addPostValue:@"2695688670" forKey:@"client_id"];
    [request addPostValue:@"4db99fceff3c9d64848ecd50373ec00e" forKey:@"client_secret"];
    [request addPostValue:@"authorization_code" forKey:@"grant_type"];
    [request addPostValue:code forKey:@"code"];
    [request addPostValue:@"http://www.baidu.com" forKey:@"redirect_uri"];
    
    [request setCompletionBlock:^{
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingMutableContainers error:nil];
        NSString *access_token = dic[@"access_token"];
        NSString *expires_in = dic[@"expires_in"];
        NSString *uid = dic[@"uid"];
        
        [[NSUserDefaults standardUserDefaults]setObject:access_token forKey:access_token_key];
        [[NSUserDefaults standardUserDefaults]setObject:uid forKey:uid_key];
        
        NSDate *finalDate = [NSDate dateWithTimeIntervalSinceNow:[expires_in longLongValue]];
        [[NSUserDefaults standardUserDefaults]setObject:finalDate forKey:expires_in_key];
        
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        if (completion) {
            
            completion();
        }
        
        
        
    }];
    
    [request startAsynchronous];
    
}

+ (void)getFriendsTimeLineWithBlock:(void(^)(NSArray*))completion{
    
    NSString *access_token = [[NSUserDefaults standardUserDefaults]objectForKey:access_token_key];
    NSString *urlString = [NSString stringWithFormat:@"https://api.weibo.com/2/statuses/home_timeline.json?access_token=%@",access_token];
    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    [request setCompletionBlock:^{
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingMutableContainers error:nil];
        
        NSArray *array = dic[@"statuses"];
        
        NSMutableArray *arr = [NSMutableArray array];
        
        for (NSDictionary *dict in array) {
            
            StatuseModel *statuse = [StatuseModel modelWithDic:dict];
            
            [arr addObject:statuse];
            
        }
        
        if (completion) {
            completion(arr);
        }

    }];
    
    
    [request startAsynchronous];
    
}

@end
