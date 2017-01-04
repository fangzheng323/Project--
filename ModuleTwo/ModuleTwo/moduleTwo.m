//
//  moduleTwo.m
//  ModuleTwo
//
//  Created by 方正 on 2016/12/26.
//  Copyright © 2016年 fang. All rights reserved.
//

#import "moduleTwo.h"

@implementation moduleTwo

- (NSString*)moduleName{
    return @"游戏(nameTwo)";
}

- (UIImage*)moduleIcon{
    return UIImageNamed(@"mobile_icon");
}
- (UIViewController*)entryViewController{
    if (!_entryViewController) {
        _entryViewController = UIStoryBoardNamed(@"TwoSB").instantiateInitialViewController;
    }
    return _entryViewController;
}
@end
