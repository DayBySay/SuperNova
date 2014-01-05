//
//  SNAlbum.m
//  SuperNova
//
//  Created by 清 貴幸 on 2013/12/21.
//  Copyright (c) 2013年 清 貴幸. All rights reserved.
//

#import "SNAlbum.h"

@implementation SNAlbum

+ (void)getAlbumsByArtistName:(NSString *)artistName success:(void (^)(AFHTTPRequestOperation *, id))success failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure
{
    NSDictionary *params = @{@"entity" : @"album",
                             @"country" : @"jp",
                             @"term" : artistName};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/wa/wsSearch"
      parameters:params
         success:success
         failure:failure];
}

@end
