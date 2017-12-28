//
//  MainViewController.m
//  TOWORK
//
//  Created by Pisces on 2017/12/20.
//  Copyright © 2017年 Pisces. All rights reserved.
//

#import "MainViewController.h"
#import "MainHeaderView.h"
#import "MainViewCell.h"
@interface MainViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) MainHeaderView *headerView;

@property (strong, nonatomic) UICollectionView *collectionView;

@property (assign, nonatomic) CGFloat offsetX;

@end

@implementation MainViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:0];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}

- (void)setUI {
    
    [self setBgColorWithR:0 G:143 B:234];
    self.title = @"TOWORK";
    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat navHeight = self.navigationController.navigationBar.frame.size.height + [UIApplication sharedApplication].statusBarFrame.size.height;
    self.headerView = [[MainHeaderView alloc] initWithFrame:CGRectMake(0, navHeight, SSScreenW, 300)];
    [self.view addSubview:self.headerView];
    [self.view addSubview:self.collectionView];
}


- (UICollectionView *)collectionView {
    if (!_collectionView) {
        CGFloat height = SSScreenH - CGRectGetMaxY(self.headerView.frame) - 49;
        UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
        flow.itemSize = CGSizeMake(SSScreenW - 120, height);
        [flow targetContentOffsetForProposedContentOffset:CGPointMake(80, CGRectGetMaxY(self.headerView.frame))];
        flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.headerView.frame), SSScreenW, height) collectionViewLayout:flow];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate        = self;
        _collectionView.dataSource      = self;
        _collectionView.pagingEnabled   = YES;
        _collectionView.contentInset    = UIEdgeInsetsMake(0, 80, 0, 80);
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.decelerationRate = 10;
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([MainViewCell class]) bundle:nil] forCellWithReuseIdentifier:@"cell"];
    }
    return _collectionView;
}

#pragma mark - dataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MainViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

#pragma mark - delegate
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    self.offsetX = scrollView.contentOffset.x;
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    if (fabs(scrollView.contentOffset.x - self.offsetX) > 10) {
        
        if (scrollView.contentOffset.x > self.offsetX) {
            
            int i = scrollView.contentOffset.x/([UIScreen mainScreen].bounds.size.width - 30)+1;
            
            NSIndexPath * index = [NSIndexPath indexPathForRow:i inSection:0];
            
            [_collectionView scrollToItemAtIndexPath:index atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
            
        }else{
            
            int i = scrollView.contentOffset.x/([UIScreen mainScreen].bounds.size.width - 30)+1;
            
            NSIndexPath * index = [NSIndexPath indexPathForRow:i-1 inSection:0];
            
            [self.collectionView scrollToItemAtIndexPath:index atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
            
        }
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (fabs(scrollView.contentOffset.x - self.offsetX) > 20) {
        
        if (scrollView.contentOffset.x > self.offsetX) {
            
            int i = scrollView.contentOffset.x/([UIScreen mainScreen].bounds.size.width - 30)+1;
            
            NSIndexPath * index = [NSIndexPath indexPathForRow:i inSection:0];
            
            [_collectionView scrollToItemAtIndexPath:index atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
            
        }else{
            
            int i = scrollView.contentOffset.x/([UIScreen mainScreen].bounds.size.width - 30)+1;
            
            NSIndexPath * index = [NSIndexPath indexPathForRow:i-1 inSection:0];
            
            [_collectionView scrollToItemAtIndexPath:index atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
            
        }
    }
}


#pragma mark - 设置背景渐变
//还是不应该使用layer, 应该直接用图片更好更改
- (void)setBgColorWithR:(CGFloat)R G:(CGFloat)G B:(CGFloat)B {

    //逐渐透明效果,线性渐变
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame            = self.view.bounds;
    gradient.colors = [NSArray arrayWithObjects:
                       (id)[UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0].CGColor,
                       (id)[UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0].CGColor,
                       (id)[UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0].CGColor,
                       (id)[UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0].CGColor,nil];
    [self.view.layer addSublayer:gradient];
    self.view.backgroundColor = [UIColor clearColor];
}



@end
