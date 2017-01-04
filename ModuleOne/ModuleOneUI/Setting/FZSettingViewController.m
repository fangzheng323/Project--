//
//  FZSettingViewController.m
//  ModuleOne
//
//  Created by 方正 on 2016/12/26.
//  Copyright © 2016年 fang. All rights reserved.
//

#import "FZSettingViewController.h"
#import "AppDelegate.h"
@interface FZSettingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *topView;
@property (nonatomic, strong) NSArray *dataArr;
@property (nonatomic, assign) CGFloat imageHight;
@property (nonatomic, strong) UIVisualEffectView *effectView;
@end

@implementation FZSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArr = [NSArray arrayWithObjects:@"我要直播",@"每日任务",@"观看历史",@"私信",@"官方公告",@"积分",@"设置",@"退出", nil];
    self.imageHight = 230;
    [self.view addSubview:self.tableView];
    [self.tableView addSubview:self.topView];
    UIView *vi = [[UIView alloc] initWithFrame:CGRectMake(0, -100, self.view.width, 100)];
    vi.backgroundColor = [UIColor grayColor];
    [self.tableView addSubview:vi];
//    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:(UIBlurEffectStyleLight)];
//    self.effectView = [[UIVisualEffectView alloc] initWithEffect:blur];
//    self.effectView.frame = self.topView.frame;
//    [self.tableView addSubview:self.effectView];
}
- (UIImageView*)topView{
    if (!_topView) {
        _topView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -self.imageHight, self.view.width, self.imageHight)];
        _topView.contentMode = UIViewContentModeScaleAspectFill;
        _topView.clipsToBounds = YES;
        _topView.image = UIImageNamed(@"minebg");
    }
    return _topView;
}
- (UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.contentInset =UIEdgeInsetsMake(self.imageHight,0, 0, 0);
    }
    return _tableView;
}
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.dataArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.dataArr[indexPath.row];
    cell.imageView.image = UIImageNamed(@"dong");
    return cell;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat off_y = scrollView.contentOffset.y;
    
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    if (off_y < self.imageHight) {
        CGRect frame = self.topView.frame;
        
        self.topView.frame = CGRectMake(0, off_y, frame.size.width, -off_y);
        self.effectView.frame = self.topView.frame;
//        self.effectView.alpha = 1 + (off_y + self.imageHight)/height;
    }
}
@end
