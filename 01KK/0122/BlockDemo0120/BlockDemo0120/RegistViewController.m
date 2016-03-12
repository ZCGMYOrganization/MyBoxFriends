//
//  RegistViewController.m
//  BlockDemo0120
//
//  Created by wangning on 16/1/20.
//  Copyright © 2016年 IT. All rights reserved.
//

#import "RegistViewController.h"
#import "HttpManager.h"

@interface RegistViewController ()

@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)registButtonClick:(UIButton *)sender {
    
        
    NSDictionary *dic = @{
                          @"command":@"ST_R",
                          @"name":_username.text,
                          @"psw":_password.text,
                          @"nickname":_nickName.text,
                          @"email":_email.text
                          };
    
    [HttpManager requestRegistWithParameters:dic success:^(id responseObject) {
        
        NSDictionary *dic = (NSDictionary*)responseObject;
        
        if ([dic[@"result"] integerValue] == 1) {
            
            
            [self dismissViewControllerAnimated:YES completion:nil];
            
        }
        
        
        
//        NSLog(@"--%@",responseObject);
        
    } fail:^(NSError *error) {
        
        NSLog(@"%@",error);
        
    }];
    
    
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
