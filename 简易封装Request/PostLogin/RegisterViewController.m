//
//  RegisterViewController.m
//  PostLogin
//
//  Created by Mac on 15/9/7.
//  Copyright (c) 2015年 罗炜翔. All rights reserved.
//

#import "RegisterViewController.h"
#import "Header.h"
#import "ConnectionTool.h"
#import "ViewController.h"

@interface RegisterViewController ()<SendMessageDelegate>

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


- (IBAction)registerButton:(UIButton *)sender {
    
    if (self.reNameTF.text.length == 0|| self.rePswTF.text.length == 0||self.emailTF.text.length == 0||self.nickNameTF.text.length == 0) {
        return;
    }
    
    
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(timerMove) userInfo:nil repeats:YES];
    
    ConnectionTool *tool = [[ConnectionTool alloc] initWithMethod:@"POST" WithParameter:[NSString stringWithFormat:@"command=ST_R&name=%@&psw=%@&nickname=%@&email=%@",self.reNameTF.text,self.rePswTF.text,self.nickNameTF.text,self.emailTF.text]];
    
    tool.delegate = self;
    
    [tool release];
    
}

- (void)timerMove{
    
    
    static long  number = 10000;
    
    ConnectionTool *tool = [[ConnectionTool alloc] initWithMethod:@"POST" WithParameter:[NSString stringWithFormat:@"command=ST_R&name=%ld&psw=%@&nickname=%@&email=%@",number++,self.rePswTF.text,self.nickNameTF.text,self.emailTF.text]];
    
    tool.delegate = self;
    
    [tool release];

    
}




- (void)getMessage:(id)data{
    
    NSDictionary *dic = (NSDictionary *)data;
    
    NSLog(@"%@",dic);
    
   /* if ([[dic objectForKey:@"result"] integerValue] == 1 ) {
        
        
        NSArray *array = self.navigationController.viewControllers;
        
        ViewController *vc = array[0];
        
        [self.navigationController popToViewController:vc animated:YES];
        
        vc.nameTF.text = self.reNameTF.text;
        vc.pwsTF.text = self.rePswTF.text;
        
    }else{
        
        
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"警告" message:[dic objectForKey:@"error"] delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil];
        
        [alert show];
        
        [alert release];
    }
    
    */
}



- (void)dealloc{
    
    [_reNameTF release];
    [_rePswTF release];
    [_entryPswTF release];
    [_nickNameTF release];
    [_emailTF release];

    [super dealloc];
    
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
