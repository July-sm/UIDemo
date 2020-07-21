//
//  MyCell.h
//  Practice4
//
//  Created by Bytedance on 2020/6/17.
//  Copyright © 2020 july. All rights reserved.
//

#ifndef IMCell_h
#define IMCell_h
#import <UIKit/UIKit.h>

#define Cell_Height 70


@class IMModel;


@interface IMCell : UITableViewCell

@property(nonatomic,strong) IMModel *model;

-(void)setModel:(IMModel *)model;

@end


#endif /* IMCell_h */
