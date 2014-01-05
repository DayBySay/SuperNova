//
//  SNAlbumViewController.h
//  SuperNova
//
//  Created by 清 貴幸 on 2014/01/06.
//  Copyright (c) 2014年 清 貴幸. All rights reserved.
//

#import "SNTableViewController.h"
#import "SNAlbum.h"

@interface SNAlbumViewController : SNTableViewController
@property (weak, nonatomic) IBOutlet UITableView *trackTableView;
@property (weak, nonatomic) IBOutlet UIImageView *artworkImageView;
@property (weak, nonatomic) IBOutlet UILabel *albumTitleLabel;
@property (nonatomic, strong) SNAlbum *album;
@property (nonatomic, strong) NSMutableArray *tracks;
@end
