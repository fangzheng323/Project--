//
//  customModule.m
//  CustomModule
//
//  Created by 方正 on 2017/1/5.
//  Copyright © 2017年 fang. All rights reserved.
//

#import "customModule.h"

@implementation customModule

- (NSString*)moduleName{
    return @"自定义";
}

- (UIImage*)moduleIcon{
    return UIImageNamed(@"query_icon");
}
- (UIViewController*)entryViewController{
//        if (!_entryViewController) {
    _entryViewController = UIStoryBoardNamed(@"CustomSB").instantiateInitialViewController;
//        }
    return _entryViewController;
}
@end
