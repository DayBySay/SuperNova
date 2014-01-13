//
//  SNUser.h
//  SuperNova
//
//  Created by 清 貴幸 on 2014/01/07.
//  Copyright (c) 2014年 清 貴幸. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface SNUser : NSObject

@property (nonatomic, strong) NSString *uuid;

+ (SNUser*)sharedManager;

- (NSString *)getUuid;
- (void)setUuid:(NSString *)uuid
        success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
        failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end
