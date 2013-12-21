//
//  SNViewController.h
//  SuperNova
//
//  Created by 清 貴幸 on 2013/12/21.
//  Copyright (c) 2013年 清 貴幸. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SNViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *artists;
@property (weak, nonatomic) IBOutlet UITableView *artistTableView;

@end
