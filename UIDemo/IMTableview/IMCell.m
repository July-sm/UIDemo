//
//  IMCell.m
//  Practice4
//
//  Created by Bytedance on 2020/6/17.
//  Copyright © 2020 july. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IMCell.h"
#import "IMModel.h"
#import "RedPointView.h"
#import "Masonry.h"
#import "HeadImageView.h"


@interface IMCell ()


@property (nonatomic, strong) UILabel *userName;
@property (nonatomic, strong) RedPointView *redPoint;
@property (nonatomic, strong) UILabel *time;
@property (nonatomic, strong) UILabel *msg;
@property (nonatomic, strong) HeadImageView *headImage;

@end

@implementation IMCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]){

        [self.contentView addSubview:self.headImage];
        [self.contentView addSubview:self.userName];
        [self.contentView addSubview:self.redPoint];
        [self.contentView addSubview:self.time];
        [self.contentView addSubview:self.msg];
        
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(Cell_Height);
        make.left.mas_equalTo(self.contentView);
        make.top.bottom.mas_equalTo(self.contentView);
    }];
    [self.userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headImage.mas_right);
        make.top.mas_equalTo(self.headImage).offset(7);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(22);
    }];
    [self.msg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headImage.mas_right);
        make.bottom.mas_equalTo(self.headImage).offset(-7);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(12);
    }];
    [self.time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(7);
        make.right.mas_equalTo(self.contentView).offset(-7);
        make.width.mas_equalTo(120);
        make.height.mas_equalTo(12);
    }];
    
}

- (void)setModel:(IMModel *)model {
    if (model == nil) {
        return;
    }
    _model = model;
    self.userName.text = model.name;
    self.msg.text = model.msg;
    if (model.unreadCount > 0){
        self.redPoint.hidden = NO;
        if (model.unreadCount >= 10) {
            [self.redPoint mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.right.mas_equalTo(self.headImage);
                make.height.mas_equalTo(Red_Point_Height+1);
                make.width.mas_equalTo(Red_Point_Height+10);
               
            }];
        }else {
            [self.redPoint mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.right.mas_equalTo(self.headImage);
                make.height.mas_equalTo(Red_Point_Height+1);
                make.width.mas_equalTo(Red_Point_Height+1);
            }];
        }
    }
    [self.redPoint setUnreadCount:model.unreadCount];
    self.time.text = model.time;
    NSURL *url=[NSURL URLWithString:model.imageUrl];
    [self.headImage setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:url]] ];
}

- (UILabel *)userName {
    if (!_userName) {
        _userName = [[UILabel alloc]init];
        _userName.textColor = [UIColor blackColor];
        _userName.font = [UIFont fontWithName:@"微软雅黑" size:25];
    }
    return _userName;
}

- (UILabel *)msg {
    if (!_msg) {
        _msg = [[UILabel alloc]init];
        _msg.textColor = [UIColor lightGrayColor];
        _msg.font = [UIFont fontWithName:@"微软雅黑" size:5];
    }
    return _msg;
}

- (UILabel *)time {
    if (!_time) {
        _time = [[UILabel alloc]init];
        _time.textColor = [UIColor lightGrayColor];
        _time.font = [UIFont fontWithName:@"微软雅黑" size:5];
        _time.textAlignment = NSTextAlignmentRight;
    }
    return _time;
}

- (RedPointView *)redPoint {
    if (!_redPoint) {
        _redPoint = [[RedPointView alloc] initWithFrame:CGRectMake(0, 0, 7, 7)];
        _redPoint.hidden = YES;
    }
    return _redPoint;
}

- (HeadImageView *)headImage {
    if (!_headImage) {
        _headImage = [[HeadImageView alloc] init];
    }
    return _headImage;
}



@end
