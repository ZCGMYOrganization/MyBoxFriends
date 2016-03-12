//
//  FreindListViewController.m
//  PostLogin
//
//  Created by Mac on 15/9/7.
//  Copyright (c) 2015年 罗炜翔. All rights reserved.
//

#import "FreindListViewController.h"
#import "Header.h"
#import "ConnectionTool.h"
#import "ASKPostRequest.h"

@interface FreindListViewController ()<UITableViewDataSource,UITableViewDelegate,SendMessageDelegate,ASKGetRequestDelegate>{
    
    NSInteger          _selectedButton;
    
}

@property (nonatomic, retain) NSMutableArray *tableArray;

@end


@interface People : NSObject


@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *nickName;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *headerurl;


- (id)initWithDictionary:(NSDictionary *)dic;
+ (id)peopelWithDictionary:(NSDictionary *)dic;

@end




@implementation FreindListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.navigationItem.title = @"好友列表";
    
    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(leftBarButtonItemClick:)] autorelease];
    
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(rightBarButtonItemClick:)] autorelease];
    
    
    self.tableArray = [[[NSMutableArray alloc] init] autorelease];
    
    self.access_token = [[NSUserDefaults standardUserDefaults] objectForKey:@"token"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    
}

#pragma mark tableView代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.tableArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell = [cell initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    
    People *p = self.tableArray[indexPath.row];
    
    cell.textLabel.text = p.name;
    
    
    cell.detailTextLabel.text = p.nickName;
    
    
    return cell;
    
    
}



- (void)requestDidFinishLoading:(ASKGetRequest *)request withResponseData:(NSData *)data{
    NSLog(@"%s",__FUNCTION__);
    
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"%@",dict);
    
    
    
    
    
    NSMutableArray *dataArray = [dict objectForKey:@"data"];
    
    
    for (NSDictionary *dataDic in dataArray) {
        
        People *p = [People peopelWithDictionary:dataDic];
        
        [self.tableArray addObject:p];
        
    }
    
    [self.tableView reloadData];
    
    

    
    
}



- (IBAction)buttonClick:(UIButton *)sender {
    
    
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:BASEURL] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30] ;
    
    
    
    
//    ConnectionTool *tool = [[ConnectionTool alloc] initWithMethod:@"GET" WithParameter:[NSString stringWithFormat:@"command=ST_FL&access_token=%@",self.access_token]];
//
//
//        tool.delegate = self;
//    
//        [tool release];
    
    NSString *str = [NSString stringWithFormat:@"command=ST_FL&access_token=%@",self.access_token];
    
    ASKGetRequest *request = [ASKGetRequest requestWithURLString:str delegate:self];
    
    
    
    [request startAsynchronousRequest];
    
    
    
}


- (void)leftBarButtonItemClick:(UIBarButtonItem *)sender{
    
    
    ConnectionTool *tool = [[ConnectionTool alloc] initWithMethod:@"GET" WithParameter:[NSString stringWithFormat:@"command=ST_FL&access_token=%@",self.access_token]];
    
    
    tool.delegate = self;
    
    [tool release];

    
    [_tableArray removeAllObjects];
    
}


- (void)rightBarButtonItemClick:(UIBarButtonItem *)sender{
    
    
    
    
}

- (void)dealloc{
    
    
    [_tableView release];
    [super dealloc];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end



@implementation People

- (void)dealloc{
    
    self.email = nil;
    self.name = nil;
    self.headerurl = nil;
    self.nickName = nil;
    
    
    [super dealloc];
}



- (id)initWithDictionary:(NSDictionary *)dic{
    
    if (self = [super init]) {
        
        self.name = [dic objectForKey:@"name"];
        
        self.nickName = [dic objectForKey:@"nickname"];
        
        self.email = [dic objectForKey:@"email"];
        
        self.headerurl = [dic objectForKey:@"headerurl"];
        
        
    }
    
    return self;
    
}

+ (id)peopelWithDictionary:(NSDictionary *)dic{
    
    
    return [[[self alloc] initWithDictionary:dic] autorelease];

}


@end


