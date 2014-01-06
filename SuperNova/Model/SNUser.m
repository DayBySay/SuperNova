//
//  SNUser.m
//  SuperNova
//
//  Created by 清 貴幸 on 2014/01/07.
//  Copyright (c) 2014年 清 貴幸. All rights reserved.
//

#import "SNUser.h"
#import "SNKeyChain.h"
#import "SNUserDefault.h"

@implementation SNUser

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

+ (NSString *)getUUID
{
    NSString *uuidString = nil;
    
    if ([SNKeyChain sharedManager].uuid != nil) {
        uuidString = [SNKeyChain sharedManager].uuid;
    } else if([SNUserDefault sharedManager].uuid  != nil) {
        // ない場合はuser defaultから探す
        uuidString = [SNUserDefault sharedManager].uuid;
    }
    
    if (uuidString == nil) {
        // 端末をサーバに登録してUUIDを取得
    }
    [SNKeyChain sharedManager].uuid = uuidString;
    [SNUserDefault sharedManager].uuid = uuidString;
    return uuidString;
}
@end
