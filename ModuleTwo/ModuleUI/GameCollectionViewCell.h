//
//  GameCollectionViewCell.h
//  ModuleTwo
//
//  Created by 方正 on 2016/12/30.
//  Copyright © 2016年 fang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameTypeList.h"
#import "GameDetailModel.h"
@interface GameCollectionViewCell : UICollectionViewCell

@property (nonatomic , strong) GameTypeList *listModel;

@property (nonatomic , strong) GameDetailModel *detail;
@end
