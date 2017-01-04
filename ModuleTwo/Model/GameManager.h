//
//  GameManager.h
//  ModuleTwo
//
//  Created by 方正 on 2016/12/30.
//  Copyright © 2016年 fang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FZHTTPRequestNetWorking.h"

typedef void (^Complete)(id data,NSError *error);

@interface GameManager : NSObject
+(GameManager*)shareManager;
//类型列表
- (void)requestGameTypeListWith:(NSString*)pageStr complete:(Complete)complete;
//详细列表
- (void)requestDetailListWith:(NSString*)page listID:(NSString*)ID complete:(Complete)complete;
@end
