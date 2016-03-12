//
//  CustoView.m
//  ImagePickDelegateDemo0105
//
//  Created by wangning on 16/1/5.
//  Copyright © 2016年 IT. All rights reserved.
//

#import "CustoView.h"

@implementation CustoView


- (id)initWithFrame:(CGRect)frame{
    
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(test:)];
        
        [self addGestureRecognizer:tap];
        
    }
    
    return self;
}

- (void)test:(UITapGestureRecognizer*)recognizer{

    
    
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    
    if ([self.delegate respondsToSelector:@selector(funcB)]) {
        
        [self.delegate funcB];
    }else if ([self.delegate respondsToSelector:@selector(funcA)]){
        
        [self.delegate funcA];
        
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
