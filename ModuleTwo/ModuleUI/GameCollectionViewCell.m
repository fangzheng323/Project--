//
//  GameCollectionViewCell.m
//  ModuleTwo
//
//  Created by 方正 on 2016/12/30.
//  Copyright © 2016年 fang. All rights reserved.
//

#import "GameCollectionViewCell.h"

@interface GameCollectionViewCell()
@property (nonatomic , strong) UIImageView *iconImage;
@property (nonatomic , strong) UILabel *titleLab;

@end
@implementation GameCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        [self loadUI];
    }
    return self;
}
- (void)setListModel:(GameTypeList *)listModel
{
    _listModel = listModel;
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:listModel.spic] placeholderImage:UIImageNamed(@"minebg.jpg")];
    self.titleLab.text = listModel.name;
}
- (void)setDetail:(GameDetailModel *)detail
{
    _detail = detail;
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:_detail.spic] placeholderImage:UIImageNamed(@"minebg.jpg")];
    self.titleLab.text = _detail.title;
}
- (void)loadUI
{
    self.iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.width, self.contentView.height-20)];
//    self.iconImage.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:self.iconImage];
    
    self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, self.contentView.height-20, self.contentView.width, 20)];
//    self.titleLab.backgroundColor = [UIColor redColor];
    self.titleLab.textAlignment = NSTextAlignmentCenter;
    self.titleLab.font = [UIFont systemFontOfSize:12];
    self.titleLab.text = @"标题";
    [self.contentView addSubview:self.titleLab];
}
@end
