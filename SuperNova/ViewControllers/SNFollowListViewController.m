//
//  SNFollowListViewController.m
//  SuperNova
//
//  Created by Sei Takayuki on 2014/01/12.
//  Copyright (c) 2014年 清 貴幸. All rights reserved.
//

#import "SNFollowListViewController.h"

@interface SNFollowListViewController ()

@end

@implementation SNFollowListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.followArtists = @[@"Perfume",
                           @"きゃりーぱみゅぱみゅ",
                           @"Thee Michelle Gun Elephant"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tablew view delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.followArtists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = self.followArtists[indexPath.row];
    // Configure the cell...
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
