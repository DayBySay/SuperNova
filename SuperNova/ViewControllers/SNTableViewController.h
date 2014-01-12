//
//  SNTableViewController.h
//  SuperNova
//
//  Created by 清 貴幸 on 2013/12/21.
//  Copyright (c) 2013年 清 貴幸. All rights reserved.
//

#import "SNViewController.h"

@interface SNTableViewController : SNViewController <UITableViewDataSource, UITableViewDelegate>
    
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
