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

static SNUser *sharedInstance = nil;


@implementation SNUser

+ (SNUser *)sharedManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[SNUser alloc] init];
    });
    return sharedInstance;
}

+ (id)allocWithZone:(NSZone *)zone {
    
    @synchronized(self) {
        if (sharedInstance == nil) {
            sharedInstance = [super allocWithZone:zone];
            return sharedInstance;  // 最初の割り当てで代入し、返す
        }
    }
    return nil; // 以降の割り当てではnilを返すようにする
}

- (NSString *)getUuid
{
    NSString *uuidString = nil;
    
    if ([SNKeyChain sharedManager].uuid != nil) {
        uuidString = [SNKeyChain sharedManager].uuid;
    } else if([SNUserDefault sharedManager].uuid  != nil) {
        // ない場合はuser defaultから探す
        uuidString = [SNUserDefault sharedManager].uuid;
    }
    
    return uuidString;
}

- (void)setUuid:(NSString *)uuid
        success:(void (^)(AFHTTPRequestOperation *, id))success
        failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure
{
    NSDictionary *params = @{@"uuid" : uuid};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //TODO URLの変更
    [manager POST:@"http://163.43.163.218/worldsend/public/users"
      parameters:params
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             [SNKeyChain sharedManager].uuid = uuid;
             [SNUserDefault sharedManager].uuid = uuid;
             success(operation, responseObject);
         }
         failure:failure];
    
}

@end
