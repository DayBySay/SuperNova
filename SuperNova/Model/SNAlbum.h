//
//  SNAlbum.h
//  SuperNova
//
//  Created by 清 貴幸 on 2013/12/21.
//  Copyright (c) 2013年 清 貴幸. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface SNAlbum : NSObject

@property (nonatomic, strong) NSString *collectionId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *artistName;
@property (nonatomic, strong) NSString *artwork;
@property (nonatomic, strong) NSString *releaseDate;


+ (void)getAlbumsByArtistName:(NSString *)artistName
                  success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                  failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;
@end
