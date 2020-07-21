//
//  IMModel.h
//  Practice4
//
//  Created by Bytedance on 2020/6/18.
//  Copyright © 2020 july. All rights reserved.
//

#ifndef IMModel_h
#define IMModel_h
#import <UIKit/UIKit.h>
@interface IMModel:NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) NSInteger ID;
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *imageUrl;
@property (nonatomic, assign) NSInteger unreadCount;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end

#endif /* IMModel_h */
