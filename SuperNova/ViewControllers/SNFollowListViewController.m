//
//  SNFollowListViewController.m
//  SuperNova
//
//  Created by Sei Takayuki on 2014/01/12.
//  Copyright (c) 2014年 清 貴幸. All rights reserved.
//

#import "SNFollowListViewController.h"
#import "SNArtist.h"
#import "SNUser.h"

@interface SNFollowListViewController ()

@end

@implementation SNFollowListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [self reloadFollowArtists];
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
    SNArtist *artist = self.followArtists[indexPath.row];
    cell.textLabel.text = artist.name;
    // Configure the cell...
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

# pragma mark - api method

- (void)reloadFollowArtists
{
    [SNArtist getArtistsByUuid:[[SNUser sharedManager] getUuid]
                       success:^(AFHTTPRequestOperation *operation, id responseObject) {
                           self.followArtists = [[NSMutableArray alloc] init];
                           NSArray *items = [responseObject objectForKey:@"items"];
                           for (NSDictionary *item in items) {
                               SNArtist *artist = [[SNArtist alloc] init];
                               artist.itunesId = [[item objectForKey:@"itunes_id"] integerValue];
                               artist.name = [item objectForKey:@"name"];
                               artist.genre = [item objectForKey:@"genre"];
                               [self.followArtists addObject:artist];
                           }
                               [self.tableView reloadData];
                   }
                       failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                           
                       }];
}

@end
