//
//  ViewController.m
//  XMLParseDemo0105
//
//  Created by wangning on 16/1/5.
//  Copyright © 2016年 IT. All rights reserved.
//

#import "ViewController.h"
#import "People.h"

@interface ViewController ()<NSXMLParserDelegate>

@property (nonatomic,strong)NSMutableArray *array;

@property (nonatomic,strong)NSMutableDictionary *dict;

@property (nonatomic,copy)NSString *string;

@property (nonatomic,strong)People *people;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.array = [NSMutableArray array];
    
//    解析XML文件   系统提供类叫做NSXMLParser
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"xml" ofType:@"html"];
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    NSXMLParser *parser = [[NSXMLParser alloc]initWithData:data];
    
    parser.delegate = self;
    
    [parser parse];
    
    
    
    
}
//开始解析的方法
- (void)parserDidStartDocument:(NSXMLParser *)parser{
//    NSLog(@"%s",__FUNCTION__);

}

//碰到开始的标签
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName attributes:(NSDictionary<NSString *, NSString *> *)attributeDict{
    //    NSLog(@"%s",__FUNCTION__);
    
//    NSLog(@"%@",elementName);
//    
//    NSLog(@"-----%@",attributeDict);
 
    
    /*    把数据存到字典      */
//    if (!self.dict) {
//        self.dict = [NSMutableDictionary dictionary];
//    }
    
    /*    把数据存到模型      */

    if (!self.people) {
        
        self.people = [[[People alloc]init]autorelease];
    }


    
    
}

//解析标签对的内容
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
    
    self.string = string;
    
//    NSLog(@"%@",string);
    
    //    NSLog(@"%s",__FUNCTION__);
    
}

//碰到结束的标签
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName{
    
    if ([elementName isEqualToString:@"name"]) {
        
//        [self.dict setObject:self.string forKey:@"name"];
        self.people.name = self.string;
        
    }else if ([elementName isEqualToString:@"age"]){
//        
//        [self.dict setObject:self.string forKey:@"age"];
        self.people.age = self.string;
    }else if ([elementName isEqualToString:@"sex"]){
//        
//        [self.dict setObject:self.string forKey:@"sex"];
        self.people.sex = self.string;
    }else if ([elementName isEqualToString:@"user"]){
        
//        [self.array addObject:self.dict];
        
//        self.dict = nil;
        [self.array addObject:self.people];

        self.people = nil;
    }
}

//解析结束的时候调用的方法
- (void)parserDidEndDocument:(NSXMLParser *)parser{
    
//    NSLog(@"%s",__FUNCTION__);
    
//    for (NSDictionary *dic in self.array) {
//        
//        NSString *string = dic[@"name"];
//        
//        NSLog(@"%@--%@--%@",string,dic[@"age"],dic[@"sex"]);
//        
////        NSLog(@"%p",dic);
//        
//    }
    
    for (People *p in self.array) {
        
        NSLog(@"%@",p.name);
    }
}



//解析错误调用的方法
- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError{
//    NSLog(@"%s",__FUNCTION__);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    
//    self.people = nil;
    self.string = nil;
    self.array = nil;
    [super dealloc];
}

@end
