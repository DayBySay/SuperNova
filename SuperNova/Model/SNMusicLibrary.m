//
//  SNMusicLibrary.m
//  SuperNova
//
//  Created by 清 貴幸 on 2013/12/21.
//  Copyright (c) 2013年 清 貴幸. All rights reserved.
//

#import "SNMusicLibrary.h"

@implementation SNMusicLibrary

- (void)getArtistsByLibrary
{
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
        NSString *genre = [representativeItem valueForProperty:MPMediaItemPropertyGenre];
        NSLog(@"name = %@, genre = %@", [representativeItem description], genre);
    }
}

@end
