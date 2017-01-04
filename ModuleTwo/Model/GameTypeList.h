//
//  GameTypeList.h
//  ModuleTwo
//
//  Created by 方正 on 2016/12/30.
//  Copyright © 2016年 fang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameTypeList : NSObject

@property (nonatomic ,strong )NSString *appIcon;
@property (nonatomic ,strong )NSString *bpic;
@property (nonatomic ,strong )NSDictionary *descDic;
@property (nonatomic)NSInteger fid;
@property (nonatomic ,strong )NSString *gameKey;
@property (nonatomic ,strong )NSString *icon;
@property (nonatomic ,strong )NSString *Id;
@property (nonatomic ,strong )NSString *name;
@property (nonatomic ,strong )NSString *spic;
@property (nonatomic)NSInteger status;
@property (nonatomic ,strong )NSString *url;
@property (nonatomic)NSInteger watchs;
@property (nonatomic)NSInteger weight;

- (void)getDataWithArr:(NSDictionary*)data;

@end
