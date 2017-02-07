//
//  RefreshViewController.m
//  ModuleThree
//
//  Created by 方正 on 2017/1/10.
//  Copyright © 2017年 fang. All rights reserved.
//

#import "RefreshViewController.h"
#import "MJRefresh.h"
@interface RefreshViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArr;
@end

@implementation RefreshViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArr = [NSMutableArray arrayWithObjects:@"q",@"w",@"e",@"r",@"t", nil];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.contentInset = UIEdgeInsetsMake(200, 0, 0, 0);
    [self.view addSubview:self.tableView];
    
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight]];
    effectView.backgroundColor = [UIColor grayColor];
    effectView.frame = CGRectMake(0, -200, self.view.width, 200);
    [self.tableView addSubview:effectView];
    
    [self beginRefresh];
    
    
    
}
- (void)beginRefresh
{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self refresh];
    }];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self add];
    }];
    [self.tableView.mj_header beginRefreshing];
}
- (void)refresh
{
    self.dataArr = [NSMutableArray arrayWithObjects:@"q",@"w",@"e",@"r",@"t", nil];
    [self.tableView.mj_header endRefreshing];
    [self.tableView reloadData];
}
- (void)add
{
    [self.dataArr addObject:@"123"];
    [self.tableView.mj_footer endRefreshing];
    [self.tableView reloadData];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}
- (UITableViewCell*)tableView:(UITableView  *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.dataArr[indexPath.row];
    return cell;
}

@end
