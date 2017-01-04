//
//  GameTypeList.m
//  ModuleTwo
//
//  Created by 方正 on 2016/12/30.
//  Copyright © 2016年 fang. All rights reserved.
//

#import "GameTypeList.h"

@implementation GameTypeList
- (void)getDataWithArr:(NSDictionary*)data
{
    self.appIcon = data[@"appIcon"];
    self.bpic    = data[@""];
    if (![data[@"desc"] isKindOfClass:[NSNull class]]) {
        self.descDic = data[@"desc"];
    }
    self.fid     = [data[@"fid"] integerValue];
    self.gameKey = data[@"gameKey"];
    self.icon    = data[@"icon"];
    self.Id      = data[@"id"];
    self.name    = data[@"name"];
    self.spic    = data[@"spic"];
    self.status  = [data[@"status"] integerValue];
    self.url     = data[@"url"];
    if (![data[@"watchs"] isKindOfClass:[NSNull class]]) {
        self.watchs  = [data[@"watchs"] integerValue];
    }
    if (![data[@"weight"] isKindOfClass:[NSNull class]]) {
        self.weight  = [data[@"weight"] integerValue];
    }
    
}
@end
/*{
 appIcon = "https://img2.zhanqi.tv/uploads/2016/09/gameappicon-2016091213560881605.png";
 bpic = "https://img2.zhanqi.tv/uploads/2016/01/gamebpic-2016012911163474545.jpeg";
 desc = "<null>";
 fid = 0;
 gameKey = danji;
 icon = "https://img1.zhanqi.tv/uploads/2015/04/gameicon-2015042410004510269.png";
 id = 49;
 name = "\U5355\U673a\U6e38\U620f";
 spic = "https://img1.zhanqi.tv/uploads/2016/09/gamespic-2016092818181417926.jpeg";
 status = 2;
 url = "/games/danji";
 watchs = 0;
 weight = 972;
 }*/
