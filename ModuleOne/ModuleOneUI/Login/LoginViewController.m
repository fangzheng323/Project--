//
//  LoginViewController.m
//  ModuleOne
//
//  Created by 方正 on 2016/12/27.
//  Copyright © 2016年 fang. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"
@interface LoginViewController ()

@end

@implementation LoginViewController
- (instancetype)init
{
    self = [UIStoryBoardNamed(@"Login") instantiateViewControllerWithIdentifier:@"LoginViewController"];
    if (self) {
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)confireBtn:(id)sender {
    if (self.loginSuess) {
        self.loginSuess(@"suess",nil);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
