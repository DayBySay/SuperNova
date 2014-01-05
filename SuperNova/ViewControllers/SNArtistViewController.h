//
//  SNArtistViewController.h
//  SuperNova
//
//  Created by 清 貴幸 on 2014/01/05.
//  Copyright (c) 2014年 清 貴幸. All rights reserved.
//

#import "SNTableViewController.h"
#import "SNArtist.h"

@interface SNArtistViewController : SNTableViewController

@property (weak, nonatomic) IBOutlet UIImageView *artistImageView;
@property (weak, nonatomic) IBOutlet UITextView *artistDescriptionView;
@property (weak, nonatomic) IBOutlet UITableView *albumsTableView;
@property (nonatomic, strong) NSMutableArray *albums;
@property (nonatomic, strong) SNArtist *artist;

@end
