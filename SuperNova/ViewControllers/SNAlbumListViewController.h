//
//  SNAlbumListViewController.h
//  SuperNova
//
//  Created by 清 貴幸 on 2014/01/06.
//  Copyright (c) 2014年 清 貴幸. All rights reserved.
//

#import "SNViewController.h"

@interface SNAlbumListViewController : SNViewController
@property (weak, nonatomic) IBOutlet UIScrollView *albumsScrollView;
@property (nonatomic, strong) NSArray *albums;

@end
