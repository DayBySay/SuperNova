//
//  SNUser.h
//  SuperNova
//
//  Created by 清 貴幸 on 2014/01/07.
//  Copyright (c) 2014年 清 貴幸. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNUser : NSObject

@property (nonatomic, strong) NSString *uuid;

+ (NSString *)getUUID;

@end
