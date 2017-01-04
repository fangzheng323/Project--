//
//  GameManager.m
//  ModuleTwo
//
//  Created by 方正 on 2016/12/30.
//  Copyright © 2016年 fang. All rights reserved.
//

#import "GameManager.h"
#import "GameTypeList.h"
#import "GameDetailModel.h"

@interface GameManager()
{
    FZHTTPRequestNetWorking *_netWorking;
}
@end

@implementation GameManager
- (instancetype)init
{
    self = [super init];
    if (self) {
        _netWorking = [FZHTTPRequestNetWorking sharedInstance];
    }
    return self;
}
+(GameManager*)shareManager
{
    static GameManager *mag;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mag = [[GameManager alloc] init];

    });
    return mag;
}
//类型列表

- (void)requestGameTypeListWith:(NSString*)pageStr complete:(Complete)complete
{
    _netWorking.baseApi = @"http://www.zhanqi.tv/api/static/game.lists/12-";
    [_netWorking createRequest:pageStr WithParam:nil withMethod:GET success:^(id result) {
        NSMutableArray *tempArr = [NSMutableArray new];
        NSArray *data = result[@"data"][@"games"];
        for (NSDictionary *diction in data) {
            GameTypeList *list = [[GameTypeList alloc] init];
            [list getDataWithArr:diction];
            [tempArr addObject:list];
        }
        complete(tempArr,nil);
    } failure:^(NSError *erro) {
        complete(nil,erro);
    } showHUD:nil];
}   

//详细列表
- (void)requestDetailListWith:(NSString*)page listID:(NSString*)ID complete:(Complete)complete
{
    NSString *api = @"http://www.zhanqi.tv/api/static/game.lives";
    _netWorking.baseApi = [NSString stringWithFormat:@"%@/%@/20-",api,ID];
    [_netWorking createRequest:page WithParam:nil withMethod:GET success:^(id result) {
        NSMutableArray *tempArr = [NSMutableArray new];
        NSArray *data = result[@"data"][@"rooms"];
        for (NSDictionary *diction in data) {
            GameDetailModel *model = [[GameDetailModel alloc] initWithDic:diction];
            [tempArr addObject:model];
        }
        complete(tempArr,nil);
    } failure:^(NSError *erro) {
        complete (nil,erro);
    } showHUD:nil];
}
@end
