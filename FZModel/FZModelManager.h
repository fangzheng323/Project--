//
//  FZModelManager.h
//  FZModel
//
//  Created by 方正 on 2016/12/27.
//  Copyright © 2016年 fang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "moduleInterface.h"
@interface FZModelManager : NSObject
+(FZModelManager*)shareManager;
- (void)loadModule;
- (NSArray*)allModules;
@end
