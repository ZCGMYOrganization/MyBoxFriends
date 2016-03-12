//
//  AppDelegate.m
//  App2Demo0107
//
//  Created by wangning on 16/1/7.
//  Copyright © 2016年 IT. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    launchOptions  该字典 只有在其他应用跳转过来的时候有值   里面有两对键值对
   
//    UIApplicationLaunchOptionsSourceApplicationKey
//    告诉我们具体从哪一个应用条转过来的
    
//    UIApplicationLaunchOptionsURLKey
    
    // 我们传过来的那个URL

    
//    NSLog(@"%@",launchOptions);
    
//    [launchOptions[UIApplicationLaunchOptionsURLKey] class];
    
    
//    [NSDictionary class];
    
//    NSStringFromClass(<#Class  _Nonnull aClass#>)
    
    

    
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:NSStringFromClass([launchOptions[UIApplicationLaunchOptionsURLKey] class]) message:[NSString stringWithFormat:@"%@",launchOptions] delegate:nil cancelButtonTitle:@"cancle" otherButtonTitles: nil];
    
    [alertView show];
    
    [alertView release];
    
    
    
    
    
    
    [self performSelector:@selector(postNoti:) withObject:launchOptions afterDelay:0.5];
    
    

    
    
    
    return YES;
}

- (void)postNoti:(NSDictionary*)dic{
    
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"GetData" object:nil userInfo:dic];
    
//    NSLog(@"%@",dic);
    
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"GetData" object:dic];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
