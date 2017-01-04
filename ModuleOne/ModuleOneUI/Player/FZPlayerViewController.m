//
//  FZPlayerViewController.m
//  ModuleOne
//
//  Created by 方正 on 2016/12/29.
//  Copyright © 2016年 fang. All rights reserved.
//

#import "FZPlayerViewController.h"
#import <AVFoundation/AVFoundation.h>

#import<MediaPlayer/MediaPlayer.h>
#import<CoreMedia/CoreMedia.h>
#define URL @"http://dlhls.cdn.zhanqi.tv/zqlive/"
@interface FZPlayerView :UIView
@property (nonatomic , strong) AVPlayer *player;
@end
@interface FZPlayerViewController ()
@property (nonatomic , strong) UIView *playerView;
@property (nonatomic , strong) AVPlayer *player;
@property (nonatomic , strong) AVPlayerItem *playerItem;
@property (nonatomic, assign) CATransform3D myTransform;
@property (nonatomic ,strong) UIButton *controlBtn;
@end

@implementation FZPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    [self setingPlayerView];
    [self beginPlay];
}

- (void)settingControlBtn
{
    self.controlBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.controlBtn.frame = CGRectMake(self.view.width-30, 0, 30, 30);
    [self.controlBtn setBackgroundImage:UIImageNamed(@"") forState:UIControlStateNormal];
    [self.controlBtn addTarget:self action:@selector(controlButton:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)controlButton:(UIButton*)button
{
    button.selected = !button.selected;
}
- (void)setingPlayerView;
{
    self.playerView = [[FZPlayerView alloc] initWithFrame:CGRectMake(0, 100, self.view.width, 260)];
    _myTransform = self.playerView.layer.transform;
    [self.view addSubview:self.playerView];
}
- (void)beginPlay
{
    NSString *filePath = [NSString stringWithFormat:@"%@%@.m3u8",URL,self.videoID];
    
    filePath = [filePath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    self.playerItem = [AVPlayerItem playerItemWithURL:[NSURL URLWithString:filePath]];
    self.player = [AVPlayer playerWithPlayerItem:self.playerItem];
//    self.playerView.player = self.player;
//    [self.playerView.player play];
    
    AVPlayerLayer *layer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    layer.frame = self.playerView.frame;
    [self.playerView.layer addSublayer:layer];
    [_player play];
    
}

- (BOOL)shouldAutorotate{
    return NO;
}

@end

@implementation FZPlayerView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor grayColor];
    }
    return self;
}

+(Class)layerClass{
    return [AVPlayerLayer class];
}

- (AVPlayer *)player {
    return [(AVPlayerLayer *)[self layer] player];
}

- (void)setPlayer:(AVPlayer *)player {
    [(AVPlayerLayer *)[self layer] setPlayer:player];
}
@end
