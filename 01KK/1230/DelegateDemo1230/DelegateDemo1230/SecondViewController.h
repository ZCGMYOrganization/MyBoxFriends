//
//  SecondViewController.h
//  DelegateDemo1230
//
//  Created by wangning on 15/12/30.
//  Copyright © 2015年 IT. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SecondViewControllerDelegate <NSObject>

- (void)changeColor;

@end


@interface SecondViewController : UIViewController

@property (nonatomic,assign)id viewController;

@end
