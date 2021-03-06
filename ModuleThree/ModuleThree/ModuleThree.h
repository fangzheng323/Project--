//
//  ModuleThree.h
//  ModuleThree
//
//  Created by 方正 on 2016/12/27.
//  Copyright © 2016年 fang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "moduleInterface.h"

@interface ModuleThree : NSObject<IFZModule>
@property (nonatomic,strong) NSString *moduleName;
@property (nonatomic,strong) NSString *moduleID;
@property (nonatomic,strong) UIImage  *moduleIcon;
@property (nonatomic,strong) UIViewController *entryViewController;

@end
