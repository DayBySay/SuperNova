//
//  SNAlbumsViewController.m
//  SuperNova
//
//  Created by Sei Takayuki on 2014/01/12.
//  Copyright (c) 2014年 清 貴幸. All rights reserved.
//

#import "SNAlbumsViewController.h"
#import "SNAlbumContainViewController.h"

@interface SNAlbumsViewController ()

@end

@implementation SNAlbumsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    TSPacosViewController *vc = [[TSPacosViewController alloc] initWithFrame:CGRectMake(0,
                                                                                        0,
                                                                                        CGRectGetWidth(self.containerView.frame),
                                                                                        CGRectGetHeight(self.containerView.frame))];
    vc.delegate = self;
    vc.items = self.albums;
    // cellに表示されるviewのサイズ（TSPacosViewControllerのviewサイズに対する割合）指定
    vc.containerScale = 0.9;
    [self addChildViewController:vc];
    [self.containerView addSubview:vc.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


# pragma mark - pacos delegate

- (UIViewController *)setContainerViewController:(TSPacosViewController *)pacosViewController indexPath:(NSIndexPath *)indexPath
{
    SNAlbumContainViewController *containVC = [self.storyboard instantiateViewControllerWithIdentifier:@"contain"];
    containVC.album = self.albums[indexPath.row];
    return containVC;
}

@end
