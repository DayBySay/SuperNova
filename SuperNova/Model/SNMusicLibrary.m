//
//  SNMusicLibrary.m
//  SuperNova
//
//  Created by 清 貴幸 on 2013/12/21.
//  Copyright (c) 2013年 清 貴幸. All rights reserved.
//

#import "SNMusicLibrary.h"
#import "SNArtist.h"

@implementation SNMusicLibrary

- (NSArray *)getArtistsByLibrary
{
    NSMutableArray *mArtists = [[NSMutableArray alloc] init];
    
    // メディアクエリの指定：
    // メディアプロパティ述語を含まないため、iPodライブラリ全体になります
    MPMediaQuery *everything = [[MPMediaQuery alloc] init];
    
    // メディアクエリにメディアアイテムのグループを構成：ここではアーティストでグループ化
    [everything setGroupingType: MPMediaGroupingArtist];
    
    // キューからメディアアイテムコレクションの取得
    NSArray *collections = [everything collections];
    for (MPMediaItemCollection *item in collections) {
        MPMediaItem *representativeItem = [item representativeItem];
        NSString *artistName = [representativeItem valueForProperty:MPMediaItemPropertyArtist];
        MPMediaItemArtwork *artwork = [representativeItem valueForProperty:MPMediaItemPropertyArtwork];
        
        SNArtist *artist = [[SNArtist alloc] init];
        artist.name = artistName;
        artist.artwork = [artwork imageWithSize:CGSizeMake(200, 200)];
        [mArtists addObject:artist];
    }
    
    return [NSArray arrayWithArray:mArtists];
}

@end
