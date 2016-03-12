//
//  ViewController.m
//  DownloadDemo0105
//
//  Created by wangning on 16/1/5.
//  Copyright © 2016年 IT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSURLConnectionDataDelegate>

//文件读写类
@property (nonatomic,strong)NSFileHandle *handle;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%@",[self filePath]);
    
}
- (IBAction)buttonClick:(UIButton *)sender {
    
    
    //http://172.16.11.181:8080/js/DSGL.mp4
    
    NSString *urlString = @"http://172.16.11.181:8080/js/f.jpg";
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection connectionWithRequest:request delegate:self];

}

- (NSString*)filePath{
    
    
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/2.jpg"];
    
    return [NSHomeDirectory() stringByAppendingString:@"/Documents/DSGL.mp4"];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    
    NSLog(@"%@",error);
    
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    
//    文件管理类
    NSFileManager *manager = [NSFileManager defaultManager];
    
//    首先判断该路径下有没有文件  如果没有就创建一个
    if (![manager fileExistsAtPath:[self filePath]]) {
        [manager createFileAtPath:[self filePath] contents:nil attributes:nil];
    }
    
    if (!self.handle) {
        
        self.handle = [NSFileHandle fileHandleForWritingAtPath:[self filePath]];
    }
    
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    
    
//    首先需要找到文件的最末端
    
    [self.handle seekToEndOfFile];
//    写入数据
    [self.handle writeData:data];
    
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    
    NSLog(@"下载完成");
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    
    self.handle = nil;
    [super dealloc];
}

@end
