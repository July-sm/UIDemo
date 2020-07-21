//
//  RedPointView.m
//  Practice4
//
//  Created by Bytedance on 2020/7/17.
//  Copyright © 2020 july. All rights reserved.
//

#import "RedPointView.h"
#import "Masonry.h"

@interface RedPointView ()

@property (nonatomic, assign) NSInteger number;
@property (nonatomic, strong) UILabel *label;

@end


@implementation RedPointView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        self.label = [[UILabel alloc]initWithFrame:frame];
        self.label.layer.cornerRadius = Red_Point_Height/2;
        self.label.backgroundColor = [UIColor redColor];
        self.label.layer.masksToBounds = YES;
        self.label.textColor = [UIColor whiteColor];
        self.label.textAlignment = NSTextAlignmentCenter;
        
        self.label.font = [UIFont fontWithName:@"微软雅黑" size:2];
        
        [self addSubview:_label];
        
    }
    return self;
}

- (void)layoutSubviews {
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.height.width.mas_equalTo(self);
    }];
}

- (instancetype)init {
    return [self initWithFrame:CGRectZero];
}

- (void)setUnreadCount:(NSInteger)number {
    [self.label setText:[NSString stringWithFormat:@"%ld", number]];
}

@end
