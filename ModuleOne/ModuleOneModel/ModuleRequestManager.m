//
//  ModuleRequestManager.m
//  ModuleOne
//
//  Created by 方正 on 2016/12/23.
//  Copyright © 2016年 fang. All rights reserved.
//

#import "ModuleRequestManager.h"

@implementation ModuleRequestManager
+(ModuleRequestManager*)shareManager{
    static ModuleRequestManager *mng;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mng = [[ModuleRequestManager alloc] init];
    });
    return mng;
}
@end
