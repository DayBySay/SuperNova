//
//  SNAlbumListViewController.h
//  SuperNova
//
//  Created by 清 貴幸 on 2014/01/06.
//  Copyright (c) 2014年 清 貴幸. All rights reserved.
//

#import "SNViewController.h"
#import "SNModelController.h"
#import "SNAlbumViewController.h"

@interface SNAlbumListViewController : SNViewController <UIPageViewControllerDelegate>
@property (nonatomic, strong) UIPageViewController *pageViewController;
@property (nonatomic, strong) NSArray *albums;
@property (nonatomic, strong) SNAlbumViewController *nowAlbumView;

@end
