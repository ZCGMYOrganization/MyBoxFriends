//
//  FreindListViewController.h
//  PostLogin
//
//  Created by Mac on 15/9/7.
//  Copyright (c) 2015年 罗炜翔. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FreindListViewController : UIViewController

@property (retain, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, copy) NSString    *access_token;

@end
