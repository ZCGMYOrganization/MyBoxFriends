//
//  ViewController.h
//  PostLogin
//
//  Created by Mac on 15/9/7.
//  Copyright (c) 2015年 罗炜翔. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (retain, nonatomic) IBOutlet UITextField *nameTF;
@property (retain, nonatomic) IBOutlet UITextField *pwsTF;

@property (nonatomic, copy) NSString    *access_token;



@end

