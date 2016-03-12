//
//  HttpManager.m
//  SinaSecondDayDemo0114
//
//  Created by wangning on 16/1/14.
//  Copyright © 2016年 IT. All rights reserved.
//

//App Key：2695688670
//App Secret：4db99fceff3c9d64848ecd50373ec00e

#import "HttpManager.h"

#import "ASIFormDataRequest.h"

#import "StatuseModel.h"


//static NSString *access_token_key = @"access_token";

#define access_token_key @"access_token"
#define uid_key @"uid"
#define expires_in_key @"expires_in"



@interface HttpManager ()<ASIHTTPRequestDelegate>

@end

@implementation HttpManager

+ (NSURL*)loginURL{
    
    NSString *urlString = @"https://api.weibo.com/oauth2/authorize?client_id=2695688670&redirect_uri=http://www.baidu.com";
    
    return [NSURL URLWithString:urlString];
    
}

+ (BOOL)isNeedLogin{
    
    NSString *access_token = [[NSUserDefaults standardUserDefaults]objectForKey:access_token_key];
    
    if (!access_token) {
        
        return YES;
    }
    
    NSDate *nowDate = [NSDate date];
    
    NSDate *finalDate = [[NSUserDefaults standardUserDefaults]objectForKey:expires_in_key];
    
    NSComparisonResult result = [nowDate compare:finalDate];
    
    if (access_token && result == NSOrderedAscending) {
        
        return  NO;
    }
    
    return YES;
}

- (void)getAccessTokenWithCode:(NSString*)code{
    
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:@"https://api.weibo.com/oauth2/access_token"]];
    
    request.tag = RequestTypeGetAccessToken;
    
    [request addPostValue:@"2695688670" forKey:@"client_id"];
    [request addPostValue:@"4db99fceff3c9d64848ecd50373ec00e" forKey:@"client_secret"];
    [request addPostValue:@"authorization_code" forKey:@"grant_type"];
    [request addPostValue:code forKey:@"code"];
    [request addPostValue:@"http://www.baidu.com" forKey:@"redirect_uri"];
    
    request.delegate = self;
    
    [request startAsynchronous];
}


- (void)getFriendsTimeLine{
    
    NSString *accessToken = [[NSUserDefaults standardUserDefaults]objectForKey:access_token_key];
    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://api.weibo.com/2/statuses/friends_timeline.json?access_token=%@",accessToken]]];
    
    request.delegate = self;
    
    request.tag = RequestTypeGetFriendsTimeline;
    
    [request startAsynchronous];
    
    
    
    
}




- (void)requestFinished:(ASIHTTPRequest *)request{
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingMutableContainers error:nil];
    if (request.tag == RequestTypeGetAccessToken) {

        [self parseAccessTokenWithDic:dic];
    }
    
    if (request.tag == RequestTypeGetFriendsTimeline) {
        
        [self parseFriendsTimeLineWithDic:dic];
        
    }
    
}

//解析accessToken
- (void)parseAccessTokenWithDic:(NSDictionary*)dic{
    NSString *access_token = dic[@"access_token"];
    
    NSString *expires_in = dic[@"expires_in"];
    
    NSString *uid = dic[@"uid"];
    
    [[NSUserDefaults standardUserDefaults]setObject:access_token forKey:access_token_key];
    
    [[NSUserDefaults standardUserDefaults] setObject:uid forKey:uid_key];
    
    
    NSInteger timeCycle = [expires_in integerValue];
    
    NSDate *deadLineDate = [NSDate dateWithTimeIntervalSinceNow:timeCycle];
    
    [[NSUserDefaults standardUserDefaults] setObject:deadLineDate forKey:expires_in_key];
    
    BOOL success = [[NSUserDefaults standardUserDefaults] synchronize];
    
    if (success) {
        
        if ([self.delegate respondsToSelector:@selector(getAccesstoknSuccess)]) {
            
            [self.delegate getAccesstoknSuccess];
        }
    }
}

//解析好友时间轴
- (void)parseFriendsTimeLineWithDic:(NSDictionary*)dic{
    
    NSArray *array = dic[@"statuses"];
    
    NSMutableArray *arr = [NSMutableArray array];
    
    for (NSDictionary *dict in array) {
        
        StatuseModel *statuse = [StatuseModel modelWithDic:dict];
        
        [arr addObject:statuse];
        
    }
    
    if ([self.delegate respondsToSelector:@selector(getFriendsTimeLineWithArr:)]) {
        
        [self.delegate getFriendsTimeLineWithArr:arr];
        
    }
    
    
    
}


@end
