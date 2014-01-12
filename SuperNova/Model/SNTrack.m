//
//  SNTrack.m
//  SuperNova
//
//  Created by 清 貴幸 on 2014/01/06.
//  Copyright (c) 2014年 清 貴幸. All rights reserved.
//

#import "SNTrack.h"

@implementation SNTrack

+ (void)getTracksByCollectionid:(NSString *)collectionId
                        success:(void (^)(AFHTTPRequestOperation *, id))success
                        failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure
{
    NSDictionary *params = @{@"entity" : @"song",
                             @"country" : @"jp",
                             @"id" : collectionId};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"https://itunes.apple.com/lookup"
      parameters:params
         success:success
         failure:failure];
}

@end
