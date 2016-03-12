//
//  CustomTableViewCell1.m
//  CustomTableViewCell0114
//
//  Created by wangning on 16/1/14.
//  Copyright © 2016年 IT. All rights reserved.
//

#import "CustomTableViewCell1.h"

@implementation CustomTableViewCell1

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
      
        NSLog(@"%s",__FUNCTION__);
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
    NSLog(@"%s",__FUNCTION__);

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
