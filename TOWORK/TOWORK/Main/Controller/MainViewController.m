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
    
    [self setBgColor];
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
        flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.headerView.frame), SSScreenW, height) collectionViewLayout:flow];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        //_collectionView.pagingEnabled = YES;
        _collectionView.contentInset = UIEdgeInsetsMake(0, 80, 0, 80);
        _collectionView.showsHorizontalScrollIndicator = NO;
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

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"%zd",self.collectionView.visibleCells.count);
    NSIndexPath *path = [NSIndexPath indexPathForRow:2 inSection:0];
    [self.collectionView scrollToItemAtIndexPath:path atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    
}


- (void)setBgColor {
    //逐渐透明效果,线性渐变
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame            = self.view.bounds;
    gradient.colors = [NSArray arrayWithObjects:
                       (id)[UIColor colorWithRed:0 green:143/255.0 blue:234/255.0 alpha:1.0].CGColor,
                       (id)[UIColor colorWithRed:0 green:143/255.0 blue:234/255.0 alpha:1.0].CGColor,
                       (id)[UIColor colorWithRed:0 green:190/255.0 blue:234/255.0 alpha:1.0].CGColor,
                       (id)[UIColor colorWithRed:0 green:190/255.0 blue:234/255.0 alpha:1.0].CGColor,nil];
    [self.view.layer addSublayer:gradient];
    self.view.backgroundColor = [UIColor clearColor];
}



@end
