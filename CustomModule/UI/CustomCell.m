//
//  CustomCell.m
//  CustomModule
//
//  Created by 方正 on 2017/1/5.
//  Copyright © 2017年 fang. All rights reserved.
//

#import "CustomCell.h"
@interface CustomCell()

@end
@implementation CustomCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadUI];
    }
    return self;
}
- (void)loadUI
{
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.width, self.contentView.height-20)];
    [self.contentView addSubview:self.imageView];
    
    self.title = [[UILabel alloc] initWithFrame:CGRectMake(0, self.contentView.height-20, self.contentView.width, 20)];
    self.title.textAlignment = NSTextAlignmentCenter;
    self.title.font = [UIFont systemFontOfSize:12];
    self.title.text = @"标题";
    
    [self.contentView addSubview:self.title];
}
@end
