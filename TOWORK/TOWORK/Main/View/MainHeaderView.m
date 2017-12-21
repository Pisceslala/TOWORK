//
//  MainHeaderView.m
//  TOWORK
//
//  Created by Pisces on 2017/12/20.
//  Copyright © 2017年 Pisces. All rights reserved.
//

#import "MainHeaderView.h"

@interface MainHeaderView()

@property(strong, nonatomic) UIButton *iconBtn;

@property (strong, nonatomic) UILabel *welcomeLable;

@property (strong, nonatomic) UILabel *desLabel;
@end

@implementation MainHeaderView

- (instancetype)init {
    if (self = [super init]) {
        [self configView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self configView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self configView];
    }
    return self;
}

- (void)configView {
    
    self.backgroundColor = [UIColor clearColor];
    
    self.iconBtn = [[UIButton alloc] init];
    self.iconBtn.layer.masksToBounds = YES;
    self.iconBtn.layer.cornerRadius  = 35;
    [self.iconBtn setAdjustsImageWhenHighlighted:NO];
    [self.iconBtn setImage:[UIImage imageNamed:@"IMG_5660"] forState:UIControlStateNormal];
    [self addSubview:self.iconBtn];
    
    self.welcomeLable = [[UILabel alloc] init];
    self.welcomeLable.text = @"Pisces Welcome!";
    self.welcomeLable.font = [UIFont systemFontOfSize:24];
    self.welcomeLable.textColor = [UIColor whiteColor];
    [self.welcomeLable sizeToFit];
    [self addSubview:self.welcomeLable];
    
    self.desLabel = [[UILabel alloc] init];
    self.desLabel.textColor = [UIColor whiteColor];
    self.desLabel.text = @"Start recording your work.";
    self.desLabel.numberOfLines = 0;
    [self.desLabel sizeToFit];
    [self addSubview:self.desLabel];
    
    [self setupConstraint];
}

- (void)setupConstraint {
    [self.iconBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(60);
        make.leading.mas_equalTo(self.mas_leading).offset(35);
        make.height.width.mas_equalTo(70);
    }];
    
    [self.welcomeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconBtn.mas_bottom).offset(15);
        make.leading.equalTo(self.iconBtn.mas_leading);
    }];
    
    [self.desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.welcomeLable.mas_bottom).offset(8);
        make.leading.equalTo(self.welcomeLable.mas_leading);
        make.trailing.equalTo(self.welcomeLable.mas_trailing).offset(-15);
    }];
}

@end
