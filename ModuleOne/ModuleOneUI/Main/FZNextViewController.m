//
//  FZNextViewController.m
//  ModuleOne
//
//  Created by 方正 on 2016/12/26.
//  Copyright © 2016年 fang. All rights reserved.
//

#import "FZNextViewController.h"

@interface FZNextViewController ()

@end

@implementation FZNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
}
- (IBAction)openBtn:(id)sender {
    NSURL *url = [NSURL URLWithString:@"weixin://"];//com.ulucu.ULCDemo
    if([[UIApplication sharedApplication] canOpenURL:url]){
        [[UIApplication sharedApplication] openURL:url options:[NSDictionary new] completionHandler:^(BOOL success) {
            NSLog(@"yes");
            self.view.backgroundColor = [UIColor lightGrayColor];
        }];
    }else{
        NSLog(@"没有装微信");
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
