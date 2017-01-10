//
//  FZViewController.m
//  ModuleOne
//
//  Created by 方正 on 2016/12/26.
//  Copyright © 2016年 fang. All rights reserved.
//

#import "FZViewController.h"
#import "FZNextViewController.h"

@interface FZViewController ()

//@property (nonatomic , strong) UIVisualEffectView *effectView;
@end

@implementation FZViewController
//UIStoryboard * sb = [UIStoryboard storyboardWithName:@"" bundle:[NSBundle bundleWithURL:[[NSBundle mainBundle] URLForResource:@"" withExtension:@"bundle"]]];
//UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@""];
- (instancetype)init
{
    self = [UIStoryBoardNamed(@"Main") instantiateViewControllerWithIdentifier:@"FZViewController"];
    if (self) {
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", FZ);
    FZHTTPRequestNetWorking *request = [FZHTTPRequestNetWorking sharedInstance];
    request.baseApi = @"http://auth.huidian.api.ulucu.com/";
    [request createRequest:@"access/login" WithParam:@{@"av":@"1",@"account":@"fzheng@ulucu.com",@"pwd":@"fz123456",@"platform":@"ios"} withMethod:GET success:^(id result) {
        NSLog(@"suess");
    } failure:^(NSError *erro) {
        NSLog(@"error");
    } showHUD:nil];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, self.view.width, self.view.height-108)];
    imageView.image = UIImageNamed(@"minebg");
    imageView.contentMode = UIViewContentModeScaleToFill;
    imageView.clipsToBounds = YES;
    [self.view addSubview:imageView];
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blur];
    effectView.frame = imageView.frame;
//    effectView.alpha = 0.75;
    [self.view addSubview:effectView];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"goToNext"]) {
        FZNextViewController *next = (FZNextViewController*)segue.destinationViewController;
        next.hidesBottomBarWhenPushed = YES;
        NSLog(@"gotoNext");
    
    }
}



@end
