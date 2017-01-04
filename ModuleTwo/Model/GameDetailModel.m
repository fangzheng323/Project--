//
//  GameDetailModel.m
//  ModuleTwo
//
//  Created by 方正 on 2016/12/30.
//  Copyright © 2016年 fang. All rights reserved.
//

#import "GameDetailModel.h"

@implementation GameDetailModel
- (instancetype)initWithDic:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        self.avatar   = dict[@"avatar"];
        self.bpic     = dict[@"bpic"];
        self.code     = dict[@"code"];
        self.gameId   = dict[@"gameId"];
        self.gameName = dict[@"gameName"];
        self.Id       = dict[@"Id"];
        self.nickname = dict[@"nickname"];
        self.spic     = dict[@"spic"];
        self.online   = dict[@"online"];
        self.videoId  = dict[@"videoId"];
        self.title    = dict[@"title"];
        self.uid      = dict[@"uid"];
        self.url      = dict[@"url"];
    }
    return self;
}
@end
/*avatar;
 bpic;
 code;
 gameId;
 gameName;
 gameUrl;
 Id;
 nickname;
 spic;
 online;
 videoId;
 title;
 uid;
 url;*/
