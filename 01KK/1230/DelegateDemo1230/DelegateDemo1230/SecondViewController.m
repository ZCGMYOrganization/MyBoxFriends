//
//  SecondViewController.m
//  DelegateDemo1230
//
//  Created by wangning on 15/12/30.
//  Copyright © 2015年 IT. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)buttonClick:(UIButton *)sender {
//   self.delegate 就是viewController的对象
    if ([self.viewController respondsToSelector:@selector(changeColor)]) {
    
        [self.viewController changeColor];
    }
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
