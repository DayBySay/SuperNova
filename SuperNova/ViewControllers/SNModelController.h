//
//  SNModelController.h
//  test
//
//  Created by 清 貴幸 on 2014/01/06.
//  Copyright (c) 2014年 清 貴幸. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SNAlbumViewController;

@interface SNModelController : NSObject <UIPageViewControllerDataSource>

- (id)initWithAlbums:(NSArray*)albums;
- (SNAlbumViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(SNAlbumViewController *)viewController;

@end
