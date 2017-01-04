//
//  GameDetailModel.h
//  ModuleTwo
//
//  Created by 方正 on 2016/12/30.
//  Copyright © 2016年 fang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameDetailModel : NSObject
- (instancetype)initWithDic:(NSDictionary*)dict;

@property (nonatomic , strong) NSString *avatar;
@property (nonatomic , strong) NSString *bpic;
@property (nonatomic , strong) NSString *code;
@property (nonatomic , strong) NSString *gameId;
@property (nonatomic , strong) NSString *gameName;
@property (nonatomic , strong) NSString *gameUrl;
@property (nonatomic , strong) NSString *Id;
@property (nonatomic , strong) NSString *nickname;
@property (nonatomic , strong) NSString *spic;
@property (nonatomic , strong) NSString *online;
@property (nonatomic , strong) NSString *videoId;
@property (nonatomic , strong) NSString *title;
@property (nonatomic , strong) NSString *uid;
@property (nonatomic , strong) NSString *url;

@end
/*{
 avatar = "https://img2.zhanqi.tv/avatar/07/13a/71091321_1481681234.jpg";
 bpic = "https://img1.zhanqi.tv/live/20161230/193140_EXx8o_2016-12-30-17-30-52_big.jpg";
 code = 152605542;
 fireworks = "";
 fireworksHtml = "";
 gameId = 65;
 gameName = "\U767e\U53d8\U5a31\U4e50";
 gameUrl = "https://bb.zhanqi.tv";
 gender = 1;
 highlight = 0;
 hotsLevel = 0;
 id = 193140;
 nickname = AmyW;
 online = 817;
 positionType = 0;
 spic = "https://img2.zhanqi.tv/live/20161230/193140_EXx8o_2016-12-30-17-30-52.jpg";
 status = 4;
 title = "\U7b2c\U4e00\U6b21\U5f00\U64ad~\U6b22\U8fce\U6367\U573a\U54e6~";
 uid = 71091321;
 url = "/152605542";
 verscr = 0;
 videoId = "193140_EXx8o";
 }
*/
