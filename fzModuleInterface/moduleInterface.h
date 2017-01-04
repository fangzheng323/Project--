//
//  moduleInterface.h
//  ModuleOne
//
//  Created by 方正 on 2016/12/26.
//  Copyright © 2016年 fang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol IFZModule <NSObject>

@property (nonatomic,readonly) NSString *moduleName;
@property (nonatomic,readonly) NSString *moduleID;
@property (nonatomic,readonly) UIImage  *moduleIcon;
@property (nonatomic,readonly) UIViewController *entryViewController;

@end
 
