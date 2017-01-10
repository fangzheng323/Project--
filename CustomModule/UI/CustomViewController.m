//
//  CustomViewController.m
//  CustomModule
//
//  Created by 方正 on 2017/1/5.
//  Copyright © 2017年 fang. All rights reserved.
//

#import "CustomViewController.h"
#import "CustomCell.h"
#import "HeaderView.h"
#import "CustomManager.h"

@interface CustomHeaderView:UICollectionReusableView<UIScrollViewDelegate>
@property (nonatomic , strong) UIScrollView *scrollView;
@property (nonatomic , strong) UIPageControl *pageControl;
@property (nonatomic , strong) NSTimer *timer;
@property (nonatomic,assign) NSInteger currentIndex;
@property (nonatomic , strong) NSString *title;
@property (nonatomic ,strong) UILabel *titleLab;
@end

@interface CustomViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic , strong) UICollectionView *collection;
@property (nonatomic , strong) NSArray *dataArr;
@end

@implementation CustomViewController
/*
 {
 avatar = "https://img2.zhanqi.tv/avatar/60/5ac/4144_1460965464.jpg";
 bpic = "https://img2.zhanqi.tv/live/20170106/83_dotati4001_2017-01-06-17-25-33_big.jpg";
 code = 11158;
 fireworks = "";
 fireworksHtml = "";
 gameId = 28;
 gameName = "\U624b\U673a\U6e38\U620f";
 gameUrl = "/games/MobileGames";
 gender = 2;
 highlight = 0;
 hotsLevel = 19;
 id = 83;
 nickname = "\U6e38\U620f\U98ce\U4e91\U4e00\U5957 24H";
 online = 20204;
 spic = "https://img2.zhanqi.tv/live/20170106/83_dotati4001_2017-01-06-17-25-33.jpg";
 status = 4;
 title = "\U6e38\U620f\U98ce\U4e91\U7535\U89c6\U76f4\U64ad\U95f4";
 uid = 4144;
 url = "/11158";
 verscr = 0;
 videoId = "83_dotati4001";
 }*/
///http://www.zhanqi.tv/api/static/live.index/recommend-apps.json?
- (void)viewDidLoad {
    [super viewDidLoad];
    [self settingCollection];
    [self requestData];
}
- (void)requestData
{
    [[CustomManager shareManager] requestListWith:^(id data, NSError *error) {
        self.dataArr = data;
        [self.collection reloadData];
    }];
}
- (void)settingCollection
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 10;
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    self.collection = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collection.delegate = self;
    self.collection.dataSource = self;
    self.collection.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collection];
    [self.collection registerClass:[CustomCell class] forCellWithReuseIdentifier:@"collCell"];
    [self.collection registerClass:[HeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderViewCell"];
    [self.collection registerClass:[CustomHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CustomHeaderViewCell"];
    
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return CGSizeMake(self.view.width, 250);
    }else{
        return CGSizeMake(self.view.width, 30);
    }
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionReusableView *resuableView = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        if(indexPath.section==0){
            CustomHeaderView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CustomHeaderViewCell" forIndexPath:indexPath];
            view.title = self.dataArr[indexPath.section][@"title"];
            resuableView = view;
        }else{
            HeaderView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderViewCell" forIndexPath:indexPath];
            view.titleString = self.dataArr[indexPath.section][@"title"];
            resuableView = view;
        }
    }
    return resuableView;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.dataArr.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSArray *arr = self.dataArr[section][@"lists"];
    return arr.count;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((self.view.width-30)/2, 180);
}
- (__kindof UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    NSString *urlS = self.dataArr[indexPath.section][@"lists"][indexPath.row][@"spic"];
    NSString *titleS = self.dataArr[indexPath.section][@"lists"][indexPath.row][@"title"];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:urlS] placeholderImage:UIImageNamed(@"img4.jpg")];
    cell.title.text = titleS;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *roomID = self.dataArr[indexPath.section][@"lists"][indexPath.row][@"videoId"];
    UIViewController *vc = [[NSClassFromString(@"FZPlayerViewController") alloc] init];
    [vc setValue:roomID forKey:@"videoID"];
    [self.navigationController pushViewController:vc animated:YES];
}
@end



@implementation CustomHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self settingScrollView];
    }
    return self;
}
- (void)setTitle:(NSString *)title
{
    _title = title;
    self.titleLab.text = title;
}
- (void)settingScrollView
{
    self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(20, self.height-30, self.width, 30)];
    self.titleLab.text = self.title;
    [self addSubview:self.titleLab];
    self.currentIndex = 0;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(moveT) userInfo:nil repeats:YES];
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.width, 210)];
    self.scrollView.backgroundColor = [UIColor redColor];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(self.width*3, self.height);

    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(self.width-150, self.scrollView.height-40, 150, 20)];
    self.pageControl.tintColor = [UIColor grayColor];
    self.pageControl.pageIndicatorTintColor = [UIColor redColor];
    self.pageControl.numberOfPages = 3;
    [self addSubview:self.scrollView];
    [self addSubview:self.pageControl];
    
    for (NSInteger i = 0; i<3; i++) {
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.width*i, 0, self.width, self.height)];
        NSString *name =[NSString stringWithFormat:@"img%ld.jpg",i+4];
        imageView.image = UIImageNamed(name);
        imageView.backgroundColor = [UIColor whiteColor];
        [self.scrollView addSubview:imageView];
    }
}

- (void)moveT
{
    self.currentIndex+=1;
    if (self.currentIndex == 3) {
        self.currentIndex = 0;
    }
    [self.scrollView setContentOffset:CGPointMake(self.width*self.currentIndex,0) animated:YES];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int index = scrollView.contentOffset.x/self.width;
    
    self.pageControl.currentPage = index;
}
@end
