//
//  BaseInfoTableViewCell.m
//  photoTutorial
//
//  Created by het on 2017/5/27.
//  Copyright © 2017年 jacob. All rights reserved.
//

#import "BaseInfoTableViewCell.h"
#import "masonry.h"
#import "UIImageView+commen.h"
@interface BaseInfoTableViewCell ()

@property (nonatomic, strong) UIImageView *baseInfoimage;
@property (nonatomic, strong) UILabel *baseInfotext;

@end

@implementation BaseInfoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.baseInfoimage];
        [self.contentView addSubview:self.baseInfotext];
        [self baseInfoImageFrame];
        [self baseInfoTextFrame];
    }
    return self;
}

- (UIImageView *)baseInfoimage {
    if (!_baseInfoimage) {
        _baseInfoimage = [[UIImageView alloc]init];
    }
    return _baseInfoimage;
}

- (UILabel *)baseInfotext {
    if (!_baseInfotext) {
        _baseInfotext = [[UILabel alloc]init];
    }
    return _baseInfotext;
}

- (void)baseInfoImageFrame {
    [self.baseInfoimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(5);
        make.left.equalTo(self.mas_left).offset(5);
        make.width.and.height.mas_equalTo(50);
    }];
}

- (void)baseInfoTextFrame {
    [self.baseInfotext mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.baseInfoimage.mas_right).offset(10);
        make.top.equalTo(self.mas_top).offset(20);
    }];
}

- (void)setModel:(detailInfo *)model {
    _model = model;
    self.baseInfotext.text = model.des;
    [self.baseInfoimage setImageWithUrl:model.img];

}

@end
