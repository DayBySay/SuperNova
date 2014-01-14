//
//  SNArtist.h
//  SuperNova
//
//  Created by 清 貴幸 on 2013/12/21.
//  Copyright (c) 2013年 清 貴幸. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface SNArtist : NSObject

@property (nonatomic) int itunesId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *genre;
@property (nonatomic, strong) UIImage *artwork;

+ (void)getArtistsByKeyword:(NSString *)keyword
                    success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                    failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

+ (void)getArtistDescriptionByKeyword:(NSString *)keyword
                    success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                    failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

- (void)followWithUuid:(NSString *)uuid
              isFollow:(BOOL)isFollow
               success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
               failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end
