//
//  MainViewCell.m
//  TOWORK
//
//  Created by Pisces on 2017/12/20.
//  Copyright © 2017年 Pisces. All rights reserved.
//

#import "MainViewCell.h"

@interface MainViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *title_Label;

@end

@implementation MainViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 12;
    
    self.iconImageView.layer.masksToBounds = YES;
    self.iconImageView.layer.cornerRadius = self.iconImageView.JYD_Width / 2;
    self.iconImageView.backgroundColor = [UIColor lightGrayColor];
}

@end
