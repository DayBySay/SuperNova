//
//  SNAlbumContainViewController.m
//  SuperNova
//
//  Created by Sei Takayuki on 2014/01/12.
//  Copyright (c) 2014年 清 貴幸. All rights reserved.
//

#import "SNAlbumContainViewController.h"
#import "SNTrack.h"

@interface SNAlbumContainViewController ()

@end

@implementation SNAlbumContainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.titleLabel.text = self.album.name;
    [SNTrack getTracksByCollectionid:self.album.collectionId
                             success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                 NSArray *results = [responseObject objectForKey:@"results"];
                                 NSMutableArray *tracks = [[NSMutableArray alloc] init];
                                 for (NSDictionary *item in results) {
                                     SNTrack *track = [[SNTrack alloc] init];
                                     track.trackId = [item objectForKey:@"trackId"];
                                     track.title = [item objectForKey:@"trackName"];
                                     track.trackCount = [[item objectForKey:@"trackCount"] integerValue];
                                     [tracks addObject:track];
                                 }
                                 self.album.tracks = tracks;
                                 [self.trackListView reloadData];
                             }
                             failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                 
                             }];
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
    return self.album.tracks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    SNTrack *track = [self.album.tracks objectAtIndex:indexPath.row];
    cell.textLabel.text = track.title;
    
    // Configure the cell...
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

@end
