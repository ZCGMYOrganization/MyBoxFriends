//
//  CustoView.h
//  ImagePickDelegateDemo0105
//
//  Created by wangning on 16/1/5.
//  Copyright © 2016年 IT. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustoViewDelegate <NSObject>

@optional

- (void)funcA;

- (void)funcB;

@end


@interface CustoView : UIView

@property (nonatomic,assign)id delegate;

@end
