//
//  HeaderView.m
//  CustomModule
//
//  Created by 方正 on 2017/1/6.
//  Copyright © 2017年 fang. All rights reserved.
//

#import "HeaderView.h"
@interface HeaderView()
@property (nonatomic,strong) UILabel *titleLab;
@end
@implementation HeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self UI];
//        self.backgroundColor = [UIColor grayColor];
    }
    return self;
}
- (void)setTitleString:(NSString *)titleString
{
    _titleString = titleString;
    self.titleLab.text = titleString;
}

- (void)UI
{
    self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, self.width, 40)];
    self.titleLab.text = @"分组类型";
    [self addSubview:self.titleLab];
}
@end
