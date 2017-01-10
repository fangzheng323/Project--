//
//  CustomManager.h
//  CustomModule
//
//  Created by 方正 on 2017/1/6.
//  Copyright © 2017年 fang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FZHTTPRequestNetWorking.h"
typedef void (^Completion)(id data,NSError *error);

@interface CustomManager : NSObject
+ (CustomManager*)shareManager;

- (void)requestListWith:(Completion)comp;
@end
