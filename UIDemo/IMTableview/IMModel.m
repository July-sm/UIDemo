//
//  IMModel.m
//  Practice4
//
//  Created by Bytedance on 2020/6/18.
//  Copyright © 2020 july. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IMModel.h"

@interface IMModel ()

@end

@implementation IMModel

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.ID =[dict[@"_id"] integerValue];
        self.name = dict[@"name"];
        self.msg = dict[@"message"];
        self.time = dict[@"time"];
        self.imageUrl = dict[@"picture"];
        self.unreadCount = [dict[@"unreadCount"] integerValue];
    }
    return self;
}

@end
