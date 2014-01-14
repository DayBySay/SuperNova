//
//  SNArtist.m
//  SuperNova
//
//  Created by 清 貴幸 on 2013/12/21.
//  Copyright (c) 2013年 清 貴幸. All rights reserved.
//

#import "SNArtist.h"

@implementation SNArtist

+ (void)getArtistsByKeyword:(NSString *)keyword
                        success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                        failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    NSDictionary *params = @{@"entity" : @"musicArtist",
                             @"country" : @"jp",
                             @"term" : keyword};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/wa/wsSearch"
      parameters:params
         success:success
         failure:failure];
}

+ (void)getArtistDescriptionByKeyword:(NSString *)keyword
                              success:(void (^)(AFHTTPRequestOperation *, id))success
                              failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure
{
    NSDictionary *params = @{@"api_key" : @"c7f19e7ae62d96c8d8f4c745324e198c",
                             @"format" : @"json",
                             @"lang" : @"jp",
                             @"artist" : keyword};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://ws.audioscrobbler.com/2.0/?method=artist.getinfo"
      parameters:params
         success:success
         failure:failure];
}

- (void)followWithUuid:(NSString *)uuid
              isFollow:(BOOL)isFollow
               success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
               failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;
{
    NSDictionary *params = @{@"name" : self.name,
                             @"itunes_id" : @(self.itunesId),
                             @"genre" : self.genre,
                             @"uuid" : uuid,
                             @"isFollow" : @(isFollow)};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //TODO URL変更
    [manager POST:@"http://163.43.163.218/worldsend/public/artists"
       parameters:params
constructingBodyWithBlock:nil
          success:success
          failure:failure];
}

@end
