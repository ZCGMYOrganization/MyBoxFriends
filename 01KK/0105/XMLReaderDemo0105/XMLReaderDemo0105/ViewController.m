//
//  ViewController.m
//  XMLReaderDemo0105
//
//  Created by wangning on 16/1/5.
//  Copyright © 2016年 IT. All rights reserved.
//

#import "ViewController.h"

#import "XMLReader.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"xml" ofType:@"html"];
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    NSError *error = nil;
    
    NSDictionary *dic = [XMLReader dictionaryForXMLData:data error:&error];
    
    NSLog(@"%@",dic);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
