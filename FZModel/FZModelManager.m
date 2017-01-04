//
//  FZModelManager.m
//  FZModel
//
//  Created by 方正 on 2016/12/27.
//  Copyright © 2016年 fang. All rights reserved.
//

#import "FZModelManager.h"
@interface FZModelManager()
@property (nonatomic,strong) NSMutableArray *modules;
@end
@implementation FZModelManager
+(FZModelManager*)shareManager{
    static FZModelManager *mng;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mng = [[FZModelManager alloc] init];
    });
    return mng;
}
- (void)loadModule{
    self.modules  = [[NSMutableArray alloc] init];
    NSString *file = [NSString stringWithFormat:@"%@/ModuleList.plist",[NSBundle mainBundle].bundlePath];
    NSArray *moduleArr = [NSArray arrayWithContentsOfFile:file];
    for (NSString *className in moduleArr) {
        
        Class moduleClass = NSClassFromString(className);
        id<IFZModule>module = [[moduleClass alloc] init];
        [self.modules addObject:module];
    }
}
- (NSArray*)allModules{
    return self.modules;
}
@end
