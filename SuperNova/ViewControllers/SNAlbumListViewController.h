//
//  SNAlbumListViewController.h
//  SuperNova
//
//  Created by 清 貴幸 on 2014/01/06.
//  Copyright (c) 2014年 清 貴幸. All rights reserved.
//

#import "SNViewController.h"
#import "SNModelController.h"

@interface SNAlbumListViewController : SNViewController <UIPageViewControllerDelegate>
@property (nonatomic, strong) UIPageViewController *pageViewController;
@property (weak, nonatomic) IBOutlet UIView *albumContainerView;
@property (nonatomic, strong) NSArray *albums;

@end
