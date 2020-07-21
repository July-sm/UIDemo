//
//  HeadImageView.h
//  Practice4
//
//  Created by Bytedance on 2020/7/17.
//  Copyright © 2020 july. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HeadImageView : UIView

@property (nonatomic, strong) UIImageView *headImage;

- (void)setImage:(UIImage*)image;

@end

NS_ASSUME_NONNULL_END
