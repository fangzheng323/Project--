//
//  FZGameViewController.m
//  ModuleTwo
//
//  Created by 方正 on 2016/12/29.
//  Copyright © 2016年 fang. All rights reserved.
//

#import "FZGameViewController.h"
#import "GameCollectionViewCell.h"
#import "GameManager.h"
#import "GameTypeList.h"
#import "FZGameDetailViewController.h"

@interface FZGameViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic ,strong) UICollectionView *collectionView;
@property (nonatomic) NSInteger page;
@property (nonatomic , strong) NSMutableArray *dataArr;
@end

@implementation FZGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    self.dataArr = [NSMutableArray new];
    self.page = 1;
    [self loadGameListWithPage:self.page];
    [self refresh];
    
}
- (void)loadGameListWithPage:(NSInteger)page
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[GameManager shareManager] requestGameTypeListWith:[NSString stringWithFormat:@"%ld.json",page] complete:^(id data, NSError *error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [self.dataArr addObjectsFromArray:(NSArray*)data];
        
        [self.collectionView.mj_footer endRefreshing];
        [self.collectionView.mj_footer endRefreshing];
        [self.collectionView reloadData];
    }];
}

- (void)refresh
{
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.page = 1;
        [self.dataArr removeAllObjects];
        [self loadGameListWithPage:self.page];
    }];
    self.collectionView.mj_footer = [MJRefreshBackFooter footerWithRefreshingBlock:^{
        self.page+=1;
        [self loadGameListWithPage:self.page];
    }];
    
}
- (UICollectionView*)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 0;
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[GameCollectionViewCell class] forCellWithReuseIdentifier:@"collectCell"];
    }
    return _collectionView;
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
    GameCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    GameTypeList *list = self.dataArr[indexPath.item];
    cell.listModel = list;
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    GameTypeList *list = self.dataArr[indexPath.item];
    FZGameDetailViewController *detailList = [[FZGameDetailViewController alloc] init];
    detailList.ID = list.Id;
    [self.navigationController pushViewController:detailList animated:YES];
}
@end
