//
//  SNArtistViewController.m
//  SuperNova
//
//  Created by 清 貴幸 on 2014/01/05.
//  Copyright (c) 2014年 清 貴幸. All rights reserved.
//

#import "SNArtistViewController.h"
#import "SNAlbum.h"
#import "UIImageView+AFNetworking.h"
#import "SNAlbumListViewController.h"
#import "SNUser.h"

@interface SNArtistViewController ()

@end

@implementation SNArtistViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.albums = [[NSMutableArray alloc] init];
    
    [SNArtist getArtistDescriptionByKeyword:self.artist.name
                                    success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                        NSDictionary *artist = [responseObject objectForKey:@"artist"];
                                        
                                        NSArray *images = [artist objectForKey:@"image"];
                                        NSString *imagePath;
                                        for (NSDictionary *item in images) {
                                            if ([[item objectForKey:@"size"] isEqualToString:@"extralarge"]) {
                                                imagePath = [item objectForKey:@"#text"];
                                            }
                                        }
                                        [self.artistImageView setImageWithURL:[NSURL URLWithString:imagePath]];
                                        
                                        
                                        NSString *summary = [[artist objectForKey:@"bio"] objectForKey:@"summary"];
                                        self.artistDescriptionView.text = summary;
                                    }
                                    failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                        
                                    }];
    [SNAlbum getAlbumsByArtistName:self.artist.name
                           success:^(AFHTTPRequestOperation *operation, id responseObject) {
                               NSArray *results = [responseObject objectForKey:@"results"];
                               for (NSDictionary *item in results) {
                                   SNAlbum *album = [[SNAlbum alloc] init];
                                   album.collectionId = [item objectForKey:@"collectionId"];
                                   album.name = [item objectForKey:@"collectionName"];
                                   album.artworkUrl = [item objectForKey:@"artworkUrl100"];
                                   album.releaseDate = [item objectForKey:@"releaseDate"];
                                   [self.albums addObject:album];
                               }
                               [self.albumsTableView reloadData];
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
    return self.albums.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    SNAlbum *album = [self.albums objectAtIndex:indexPath.row];
    cell.textLabel.text = album.name;
    [cell.imageView setImageWithURL:[NSURL URLWithString:album.artworkUrl]];
    album.artwork = cell.imageView.image;
    
    // Configure the cell...
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SNAlbumListViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"snalbumlist"];
    vc.albums = self.albums;
    [self.navigationController pushViewController:vc animated:YES];
}

# pragma mark - origin methods

- (void)followArtist
{
    [self.artist followWithUuid:[SNUser getUUID]];
}

- (void)unFollowArtist
{
    [self.artist unFollowWithUuid:[SNUser getUUID]];
}

@end
