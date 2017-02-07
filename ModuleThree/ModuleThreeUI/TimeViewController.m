//
//  TimeViewController.m
//  ModuleThree
//
//  Created by 方正 on 2017/1/9.
//  Copyright © 2017年 fang. All rights reserved.
//

#import "TimeViewController.h"
#import "UIButton+time.h"
#import "RefreshViewController.h"

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
    [btn addTarget:self action:@selector(startMove:) forControlEvents:UIControlEventTouchUpInside];
    [btn beginTime];
    [self.view addSubview:btn];
    
    UIImage *image = [self gettingImageWith:CGSizeMake(200, 200) withImage:UIImageNamed(@"img7.jpg")];
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.bounds = CGRectMake(0, 0, 200, 200);
    imageView.center = CGPointMake(self.view.width/2, self.view.height/2);
    imageView.backgroundColor = [UIColor redColor];
    imageView.image = image;
//    [self.view addSubview:imageView];
    NSAssert(self.isStop==YES,@"error");
}

- (void)startMove:(UIButton*)button
{
//    self.isStop = !self.isStop;
//    if (self.isStop == NO) {
//        [button beginTime];
//    }else{
//        button.userInteractionEnabled = NO;
//    }
    RefreshViewController *vc = [[RefreshViewController alloc] init];
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (UIImage*)gettingImageWith:(CGSize)size withImage:(UIImage*)image
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    return scaledImage;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
//     Dispose of any resources that can be recreated.
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
