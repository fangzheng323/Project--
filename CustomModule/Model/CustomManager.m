//
//  CustomManager.m
//  CustomModule
//
//  Created by 方正 on 2017/1/6.
//  Copyright © 2017年 fang. All rights reserved.
//

#import "CustomManager.h"
@interface CustomManager()
{
    FZHTTPRequestNetWorking *_netWorking;
}
@end
@implementation CustomManager
- (instancetype)init
{
    self = [super init];
    if (self) {
        _netWorking = [FZHTTPRequestNetWorking sharedInstance];
    }
    return self;
}
+ (CustomManager*)shareManager
{
    static CustomManager *mng;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mng = [[CustomManager alloc] init];
    });
    return mng;
}

- (void)requestListWith:(Completion)comp
{
    _netWorking.baseApi = @"http://www.zhanqi.tv/api/static/live.index/recommend-apps.json?";
    [_netWorking createRequest:nil WithParam:nil withMethod:GET success:^(id result) {
        NSArray *array = result[@"data"];
        comp(array,nil);
    } failure:^(NSError *erro) {
        comp(nil,erro);

    } showHUD:nil];
}
@end
