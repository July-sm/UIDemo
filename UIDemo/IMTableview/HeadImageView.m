//
//  HeadImageView.m
//  Practice4
//
//  Created by Bytedance on 2020/7/17.
//  Copyright © 2020 july. All rights reserved.
//

#import "HeadImageView.h"
#import "Masonry.h"

@implementation HeadImageView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.headImage];
    }
    return self;
}

- (void)layoutSubviews {
    NSInteger offset=3;
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).with.insets(UIEdgeInsetsMake(5, 5, 5, 5));
    }];
}

- (UIImageView *)headImage {
    if (!_headImage) {
        _headImage = [[UIImageView alloc] init];
        _headImage.layer.cornerRadius =10;
        _headImage.layer.masksToBounds = YES;
        _headImage.contentMode = UIViewContentModeScaleToFill;
    }
    return _headImage;
}

- (void)setImage:(UIImage*)image {
    self.headImage.image = image;
}

@end
