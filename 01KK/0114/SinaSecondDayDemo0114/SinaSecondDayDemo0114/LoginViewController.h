//
//  LoginViewController.h
//  SinaSecondDayDemo0114
//
//  Created by wangning on 16/1/14.
//  Copyright © 2016年 IT. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol LoginViewControllerDelegate <NSObject>

- (void)didGetAccessToken;

@end


@interface LoginViewController : UIViewController

@property (nonatomic,assign)id delegate;

@end
