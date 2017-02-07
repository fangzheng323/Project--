//
//  FZLiveViewController.m
//  ModuleThree
//
//  Created by 方正 on 2016/12/29.
//  Copyright © 2016年 fang. All rights reserved.
//

#import "FZLiveViewController.h"
#import "TimeViewController.h"

@interface FZLiveViewController ()

@property (nonatomic , strong) UIScrollView *scrollView;
@end

@implementation FZLiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIImageView *im = [[UIImageView alloc] initWithFrame:CGRectMake(10, 100, self.view.width-20, self.view.width*1.2)];
//    im.image = UIImageNamed(@"pic.jpg");
//    [self.view addSubview:im];
    [self test];
    NSArray *arr = [NSArray arrayWithObjects:
                    @"http://s2.pimg.cn/group5/M00/56/34/wKgBf1hl3-WAZrc7AAUhAR5XOs0164.jpg?imageMogr2/thumbnail/314x%3E"
                    ,@"http://s.pimg.cn/group5/M00/55/69/wKgBf1hQ60CAOes_AAk04nwxJ_s303.jpg?imageMogr2/thumbnail/314x%3E"
                    ,@"http://s5.pimg.cn/group5/M00/56/09/wKgBf1hiO8aAfEAVAAgfU1fA9ac257.jpg?imageMogr2/thumbnail/314x%3E"
                    ,@"http://s3.pimg.cn/group5/M00/52/89/wKgBfVg318iAYORBABSlTbNReeE721.jpg?imageMogr2/thumbnail/314x%3E"
                    ,@"http://s0.pimg.cn/group5/M00/56/33/wKgBf1hl39OAJXhIAArLAvk0etI512.jpg?imageMogr2/thumbnail/314x%3E"
                    ,@"http://s2.pimg.cn/group6/M00/9E/11/wKgBjFhbdX6ASJvdAAU5uIJ0Ruc050.jpg?imageMogr2/thumbnail/314x%3E"
                    ,@"http://s.pimg.cn/group5/M00/54/45/wKgBfVhl38-AHo5QAAdEU3rhubU691.jpg?imageMogr2/thumbnail/314x%3E"
                    ,@"http://s2.pimg.cn/group6/M00/9D/91/wKgBjFhOYeuAX4A0AANgQx_lgM0435.jpg?imageMogr2/thumbnail/314x%3E"
                    ,@"http://s.pimg.cn/group5/M00/56/47/wKgBf1hrUIqAZqAJAAWrYzeNtuI448.jpg?imageMogr2/thumbnail/314x%3E"
                    ,@"http://s3.pimg.cn/group6/M00/9C/E1/wKgBjVg7yp2AdNH_ABLFsr2404E801.jpg?imageMogr2/thumbnail/314x%3E"
                    ,@"http://s1.pimg.cn/group6/M00/9E/13/wKgBjFhbg0mAYMAFAAJvzLw4YqI626.jpg?imageMogr2/thumbnail/314x%3E"
                    ,@"http://s.pimg.cn/group5/M00/54/BC/wKgBf1g_3ZCAaBAoAAvoU7OWoqw323.jpg?imageMogr2/thumbnail/314x%3E"
                    ,@"http://s5.pimg.cn/group6/M00/9E/8F/wKgBjFhrT-uAX5cdAARMOKRkN50543.jpg?imageMogr2/thumbnail/314x%3E"
                    ,@"http://s2.pimg.cn/group5/M00/54/80/wKgBf1g35zKAaxyUAAgv1P5xXGk173.jpg?imageMogr2/thumbnail/314x%3E"
                    ,@"http://s0.pimg.cn/group6/M00/9E/91/wKgBjFhrYnaAGzhyAAXY_KEykoI060.jpg?imageMogr2/thumbnail/314x%3E"
                    ,@"http://s6.pimg.cn/group6/M00/9D/A1/wKgBjVhPZk6APemqAAiX9ew47fk872.jpg?imageMogr2/thumbnail/314x%3E", nil];
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    CGFloat width = (self.view.width-30)/2;
    for (NSInteger i = 0; i < arr.count; i++) {
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(10+i%2*(width+10), 10+i/2*(width*1.25+10), width, width*1.25)];
        image.tag = 10+i;
        [image sd_setImageWithURL:[NSURL URLWithString:arr[i]] placeholderImage:UIImageNamed(@"img12.jpg")];
        [self.scrollView addSubview:image];
        
        SDWebImageManager *mag = [SDWebImageManager sharedManager];
        UIImage *im = [mag.imageCache imageFromMemoryCacheForKey:arr[i]];
        NSLog(@"%f",im.size.width);
        image.userInteractionEnabled = YES;
        if (i==0) {
            UIControl *control = [[UIControl alloc] initWithFrame:image.frame];
            [control addTarget:self action:@selector(touchBtn) forControlEvents:UIControlEventTouchUpInside];
            [image addSubview:control];
        }
    }
    
    
    [self.view addSubview:self.scrollView];
    
    self.scrollView.contentSize = CGSizeMake(self.view.width, 10+arr.count/2*(width*1.25+10));
}
- (void)touchBtn
{
    TimeViewController *time = [[TimeViewController alloc] init];
    [self.navigationController pushViewController:time animated:YES];
}
- (void)test
{
    dispatch_queue_t q = dispatch_queue_create("chuanXing", NULL);
    dispatch_async(q, ^{
        NSLog(@"q  %@", [NSThread currentThread]);
        
    });
    dispatch_async(q, ^{
        NSLog(@"w  %@", [NSThread currentThread]);
        
    });
    dispatch_async(q, ^{
        NSLog(@"e  %@", [NSThread currentThread]);
        
    });
    
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, queue, ^{ 
//        [NSThread sleepForTimeInterval:4];
        NSLog(@"a");
    });
    dispatch_group_async(group, queue, ^{
//        [NSThread sleepForTimeInterval:3];
        NSLog(@"b"); });
    dispatch_group_async(group, queue, ^{
//        [NSThread sleepForTimeInterval:2];
        NSLog(@"c");});
    dispatch_group_async(group, queue, ^{
//        [NSThread sleepForTimeInterval:1];
        NSLog(@"d"); });
    dispatch_group_notify(group,dispatch_get_main_queue(), ^{
        NSLog(@"ok");
    });

    
}

@end
