//
//  SNAlbumViewController.m
//  SuperNova
//
//  Created by 清 貴幸 on 2014/01/06.
//  Copyright (c) 2014年 清 貴幸. All rights reserved.
//

#import "SNAlbumViewController.h"
#import "SNTrack.h"

@interface SNAlbumViewController ()

@end

@implementation SNAlbumViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.tracks = [[NSMutableArray alloc] init];
    [SNTrack getTracksByCollectionid:self.album.collectionId
                             success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                 NSLog(@"%@", responseObject);
                                 NSArray *results = [responseObject objectForKey:@"results"];
                                 for (NSDictionary *item in results) {
                                     SNTrack *track = [[SNTrack alloc] init];
                                     track.trackId = [item objectForKey:@"trackId"];
                                     track.title = [item objectForKey:@"trackName"];
                                     track.trackCount = [[item objectForKey:@"trackCount"] integerValue];
                                     [self.tracks addObject:track];
                                 }
                                 
                                 [self.trackTableView reloadData];
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
    return self.tracks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    SNTrack *track = [self.tracks objectAtIndex:indexPath.row];
    cell.textLabel.text = track.title;
    
    // Configure the cell...
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


@end
