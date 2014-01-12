//
//  SNAlbumContainViewController.h
//  SuperNova
//
//  Created by Sei Takayuki on 2014/01/12.
//  Copyright (c) 2014年 清 貴幸. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SNTableViewController.h"
#import "SNAlbum.h"

@interface SNAlbumContainViewController : SNTableViewController 

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) SNAlbum *album;
@property (weak, nonatomic) IBOutlet UITableView *trackListView;

@end
