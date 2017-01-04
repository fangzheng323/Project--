//
//  LoginViewController.h
//  ModuleOne
//
//  Created by 方正 on 2016/12/27.
//  Copyright © 2016年 fang. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef  void(^LoginSuess)(NSString *info,NSError *error);
@interface LoginViewController : UIViewController

@property (nonatomic,copy) LoginSuess loginSuess;
@end
