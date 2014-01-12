//
//  SNTopViewController.m
//  SuperNova
//
//  Created by 清 貴幸 on 2014/01/05.
//  Copyright (c) 2014年 清 貴幸. All rights reserved.
//

#import "SNTopViewController.h"
#import "SNMusicLibrary.h"
#import "SNArtist.h"
#import "SNArtistViewController.h"

@interface SNTopViewController ()

@end

@implementation SNTopViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view..
    
//    SNMusicLibrary *ml = [[SNMusicLibrary alloc] init];
//    self.artists = [ml getArtistsByLibrary];
    //    for (id item in self.artists) {
    //        UIImage *img = [item valueForKey:@"artwork"];
    //        NSString *name = [item valueForKey:@"name"];
    //        NSLog(@"name = %@ artwork = %@", name, img);
    //    }
    
    self.searchBar.delegate  = self;
    self.searchedItems = [[NSMutableArray alloc] init];
}


- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    [self.searchBar resignFirstResponder];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tablew view delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    NSUInteger returnValue = 0;
    
    if ([self isSearchBarTableView:tableView]) {
        returnValue = 2;
    } else {
        returnValue = 1;
    }
    return returnValue;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSUInteger returnValue = 0;
    if ([self isSearchBarTableView:tableView]) {
        returnValue = self.searchedItems.count;
    } else {
        returnValue = self.artists.count;
    }
    return returnValue;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if ([self isSearchBarTableView:tableView]) {
        if (indexPath.section == 0) {
            // artist
            SNArtist *artist = (SNArtist *)[self.searchedItems objectAtIndex:indexPath.row];
            cell.textLabel.text = artist.name;
        } else {
            // album
        }
        
    } else {
        SNArtist *artist = [self.artists objectAtIndex:indexPath.row];
        
        cell.textLabel.text = artist.name;
        cell.imageView.image = artist.artwork;
    }
    
    // Configure the cell...
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self isSearchBarTableView:tableView]) {
        SNArtistViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"snartist"];
        vc.artist = [self.searchedItems objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    } else {
        
    }
}


- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    [self.artistTableView setEditing:editing animated:animated];
}



# pragma mark - search bar delegae

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self searchByKeyword:searchBar.text];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self.searchedItems removeAllObjects];
    [self.searchDisplayController.searchResultsTableView reloadData];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [self searchByKeyword:searchBar.text];
}

- (void)searchByKeyword:(NSString *)keyword
{
    [SNArtist getArtistsByKeyword:keyword
                          success:^(AFHTTPRequestOperation *operation, id responseObject) {
                              NSArray *results = [responseObject objectForKey:@"results"];
                              [self.searchedItems removeAllObjects];
                              
                              for (NSDictionary *item in results) {
                                  SNArtist *artist = [[SNArtist alloc] init];
                                  artist.itunesId = [[item objectForKey:@"artistId"] integerValue];
                                  artist.name = [item objectForKey:@"artistName"];
                                  
                                  [self.searchedItems addObject: artist];
                              }
                              [self.searchDisplayController.searchResultsTableView reloadData];
                          }
                          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                              
                          }];
}


#pragma mark - UISearchDisplayController Delegate Methods
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    return YES;
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption {
    return YES;
}

- (BOOL)isSearchBarTableView:(UITableView*)tableView
{
    return tableView != self.artistTableView;
}

@end
