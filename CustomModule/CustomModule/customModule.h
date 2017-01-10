//
//  customModule.h
//  CustomModule
//
//  Created by 方正 on 2017/1/5.
//  Copyright © 2017年 fang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "moduleInterface.h"

@interface customModule : NSObject<IFZModule>

@property (nonatomic,strong) NSString *moduleName;
@property (nonatomic,strong) NSString *moduleID;
@property (nonatomic,strong) UIImage  *moduleIcon;
@property (nonatomic,strong) UIViewController *entryViewController;


@end
