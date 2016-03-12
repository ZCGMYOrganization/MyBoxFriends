//
//  ViewController.m
//  CustomTableViewCell0114
//
//  Created by wangning on 16/1/14.
//  Copyright © 2016年 IT. All rights reserved.
//

#import "ViewController.h"

#import "CustomTableViewCell1.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    
    
    self.tableView.rowHeight = 233;
    
    [self.tableView registerClass:[CustomTableViewCell1 class] forCellReuseIdentifier:@"cell"];
    
//    [self.tableView registerNib:[UINib nibWithNibName:@"CustomTableViewCell1" bundle:nil] forCellReuseIdentifier:@"cell"];
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomTableViewCell1 *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    return cell;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_tableView release];
    [super dealloc];
}
@end
