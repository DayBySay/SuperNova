//
//  SNTrack.h
//  SuperNova
//
//  Created by 清 貴幸 on 2014/01/06.
//  Copyright (c) 2014年 清 貴幸. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNTrack.h"
#import "AFNetworking.h"

@interface SNTrack : NSObject

@property (nonatomic, strong) NSString *trackId;
@property (nonatomic) NSUInteger trackCount;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *duration;
@property (nonatomic, strong) NSString *afiUrl;
@property (nonatomic, strong) NSString *trialUrl;



+ (void)getTracksByCollectionid:(NSString *)collectionId
                  success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                  failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;
@end
