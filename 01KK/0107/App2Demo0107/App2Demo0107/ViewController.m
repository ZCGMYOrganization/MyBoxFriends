//
//  ViewController.m
//  App2Demo0107
//
//  Created by wangning on 16/1/7.
//  Copyright © 2016年 IT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,copy)NSString *backURL;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor redColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiver:) name:@"GetData" object:nil];
    
    
}

- (void)receiver:(NSNotification*)noti{
    
//    NSDictionary *dic = noti.userInfo;
//    
//    NSLog(@"%@----%@",noti.name, noti.object);
//    
//    NSLog(@"%@",dic);
    
//    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"" message:[NSString stringWithFormat:@"%@",noti.object] delegate:nil cancelButtonTitle:@"cancle" otherButtonTitles: nil];
//    
//    [alertView show];
//    
//    [alertView release];
    
    
    NSDictionary *dict = noti.object;
    
    //这里需要注意UIApplicationLaunchOptionsURLKey 对应的value类型是NSURL
    NSURL *url = dict[UIApplicationLaunchOptionsURLKey];
    
//    App2Demo://?name=zhangsan&backURL=App1Demo:
//    NSURL 转换成字符串
    NSString *string = url.absoluteString;
    
    NSString *arg = [[string componentsSeparatedByString:@"?"] lastObject];
    
    NSString *name = [[arg componentsSeparatedByString:@"&"] firstObject];
    
    self.label.text = [[name componentsSeparatedByString:@"="] lastObject];
    
    
    NSString *backArg = [[arg componentsSeparatedByString:@"&"] lastObject];
    
    self.backURL = [[backArg componentsSeparatedByString:@"="] lastObject];
    
    
}

- (IBAction)buttonClick:(UIButton *)sender {
    
    
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@//?index=%ld",self.backURL,sender.tag]]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    
    [_backURL release];
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [_label release];
    [super dealloc];
}
@end
