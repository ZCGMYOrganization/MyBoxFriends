//
//  AppDelegate.m
//  BlockSinaDemo0119
//
//  Created by wangning on 16/1/19.
//  Copyright © 2016年 IT. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "SendWeiBoViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
//    创建一个tabBar
    
//    1 创建好友微博列表的导航
    
    ViewController *friendsTimeLineVC = [[ViewController alloc]init];
    
//  1 如果只设置VC.title 导航栏与tabbar都显示该内容
//  2 当设置了tabBarItem.image之后  具体显示谁，谁在后就显示谁
    friendsTimeLineVC.title = @"好友列表";

    friendsTimeLineVC.tabBarItem.image = [UIImage imageNamed:@"Second"];
    
    friendsTimeLineVC.tabBarItem.title = @"列表";
    
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:friendsTimeLineVC];
    [friendsTimeLineVC release];
    
//    2 创建发微博的导航
    
    SendWeiBoViewController *sendWeiBoVC = [[SendWeiBoViewController alloc]init];
    sendWeiBoVC.title = @"发微博";
    sendWeiBoVC.tabBarItem.image = [UIImage imageNamed:@"Add_Icon"];
    sendWeiBoVC.tabBarItem.title = @"微博";
    
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:sendWeiBoVC];
    [sendWeiBoVC release];
    
//    3 创建tabbarController
    
    UITabBarController *tabBarController = [[UITabBarController alloc]init];
    
    tabBarController.viewControllers = @[nav1,nav2];
    
    [nav1 release];
    [nav2 release];
    
    self.window.rootViewController = tabBarController;
    
    [tabBarController release];
    
    
    
    
    
    

    return YES;
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
