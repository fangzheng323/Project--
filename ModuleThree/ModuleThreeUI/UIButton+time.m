//
//  UIButton+time.m
//  ModuleThree
//
//  Created by 方正 on 2017/1/9.
//  Copyright © 2017年 fang. All rights reserved.
//

#import "UIButton+time.h"
NSInteger count = 60;
@implementation UIButton (time)
- (void)beginTime
{
//    NSString *count = @"60";
    count = 60;
    NSTimer *tim = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(move:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:tim forMode:NSDefaultRunLoopMode];
}

- (void)move:(NSTimer*)timer
{
//    NSInteger count = [timer.userInfo integerValue];
    if (count==-1) {
//        timer = nil;
        [timer invalidate];
        return;
    }
    [self setTitle:[NSString stringWithFormat:@"%ld秒",count] forState:UIControlStateNormal];
    count--;
}

@end
