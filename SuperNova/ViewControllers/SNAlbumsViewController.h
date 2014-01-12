//
//  SNAlbumsViewController.h
//  SuperNova
//
//  Created by Sei Takayuki on 2014/01/12.
//  Copyright (c) 2014年 清 貴幸. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSPacosViewController.h"

@interface SNAlbumsViewController : UIViewController <TSPacosViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (nonatomic, strong) NSArray *albums;

@end
