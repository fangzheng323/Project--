//
//  FZGameDetailViewController.m
//  ModuleTwo
//
//  Created by 方正 on 2016/12/30.
//  Copyright © 2016年 fang. All rights reserved.
//

#import "FZGameDetailViewController.h"
#import "GameCollectionViewCell.h"
#import "GameManager.h"
#import "GameDetailModel.h"

@interface FZGameDetailViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic , strong) UICollectionView *collectionView;
@property (nonatomic , strong) NSMutableArray *dataArr;
@property (nonatomic) NSInteger page;
@end

@implementation FZGameDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArr = [NSMutableArray new];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    layout.minimumLineSpacing = 10;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    [self.collectionView registerClass:[GameCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    self.page = 1;
    [self loadSource:self.page];
    [self refresh];
}

- (void)loadSource:(NSInteger)page
{//http://www.zhanqi.tv/api/static/game.lives/
    NSString *pageStr = [NSString stringWithFormat:@"%ld.json",page];
    [[GameManager shareManager] requestDetailListWith:pageStr listID:self.ID complete:^(id data, NSError *error) {
        [self.dataArr addObjectsFromArray:(NSArray*)data];
        [self.collectionView.mj_header endRefreshing];
        [self.collectionView.mj_footer endRefreshing];
        [self.collectionView reloadData];
    }]; }
- (void)refresh
{
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.page = 1;
        [self.dataArr removeAllObjects];
        [self loadSource:self.page];
    }];
    self.collectionView.mj_footer = [MJRefreshBackFooter footerWithRefreshingBlock:^{
        self.page+=1;
        [self loadSource:self.page];
    }];
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArr.count;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((self.view.width-40)/3, 150);
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GameCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    GameDetailModel *model = self.dataArr[indexPath.item];
    cell.detail = model;
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    GameDetailModel *model = self.dataArr[indexPath.row];
    
    UIViewController *vc = [[NSClassFromString(@"FZPlayerViewController") alloc] init];
    
    [vc setValue:model.videoId forKey:@"videoID"];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
