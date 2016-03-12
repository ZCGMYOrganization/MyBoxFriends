//
//  People.m
//  XMLParseDemo0105
//
//  Created by wangning on 16/1/5.
//  Copyright © 2016年 IT. All rights reserved.
//

#import "People.h"

@implementation People


- (void)dealloc{
    
    self.name = nil;
    self.age = nil;
    self.sex = nil;
    [super dealloc];
}

@end
