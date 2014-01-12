//
//  SNTopViewController.h
//  SuperNova
//
//  Created by 清 貴幸 on 2014/01/05.
//  Copyright (c) 2014年 清 貴幸. All rights reserved.
//

#import "SNTableViewController.h"

@interface SNTopViewController : SNTableViewController <UISearchBarDelegate, UISearchDisplayDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic, strong) NSArray *artists;
@property (nonatomic, strong) NSMutableArray *searchedItems;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
