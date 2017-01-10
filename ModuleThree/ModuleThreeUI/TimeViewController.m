//
//  TimeViewController.m
//  ModuleThree
//
//  Created by 方正 on 2017/1/9.
//  Copyright © 2017年 fang. All rights reserved.
//

#import "TimeViewController.h"
#import "UIButton+time.h"

@interface TimeViewController ()
@property (nonatomic,assign) BOOL isStop;
@end

@implementation TimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isStop = YES;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.backgroundColor = [UIColor redColor];
//    [btn addTarget:self action:@selector(startMove:) forControlEvents:UIControlEventTouchUpInside];
    [btn beginTime];
    [self.view addSubview:btn];
}

- (void)startMove:(UIButton*)button
{
    self.isStop = !self.isStop;
    if (self.isStop == NO) {
        [button beginTime];
    }else{
        button.userInteractionEnabled = NO;
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
