//
//  ModuleThree.m
//  ModuleThree
//
//  Created by 方正 on 2016/12/27.
//  Copyright © 2016年 fang. All rights reserved.
//

#import "ModuleThree.h"

@implementation ModuleThree

- (NSString*)moduleName{
    return @"直播(nameThree)";
}

- (UIImage*)moduleIcon{
    return UIImageNamed(@"query_icon");
}
- (UIViewController*)entryViewController{
    if (!_entryViewController) {
        _entryViewController = UIStoryBoardNamed(@"ThreeSB").instantiateInitialViewController;
    }
    return _entryViewController;
}
@end
