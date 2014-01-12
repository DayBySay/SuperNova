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
#import "SNFollowListViewController.h"
#import "SNWishListViewController.h"


@interface SNTopViewController ()

@end

@implementation SNTopViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.searchBar.delegate  = self;
    self.searchedItems = [[NSMutableArray alloc] init];
    
    SNFollowListViewController *follow = [self.storyboard instantiateViewControllerWithIdentifier:@"follow"];
    [self.scrollView addSubview:follow.view];
    [self addChildViewController:follow];
    follow.view.frame = CGRectMake(0,
                                   0,
                                   CGRectGetWidth([UIScreen mainScreen].bounds),
                                   CGRectGetHeight(self.scrollView.frame));
    
    SNWishListViewController *wish = [self.storyboard instantiateViewControllerWithIdentifier:@"wish"];
    [self.scrollView addSubview:wish.view];
    [self addChildViewController:wish];
    wish.view.frame = CGRectMake(CGRectGetWidth([UIScreen mainScreen].bounds),
                                 0,
                                 CGRectGetWidth([UIScreen mainScreen].bounds),
                                 CGRectGetHeight(self.scrollView.frame));
    
    self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(wish.view.frame) + CGRectGetWidth(follow.view.frame),
                                             wish.view.frame.size.height);
    
    self.scrollView.delegate = self;
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
    NSUInteger returnValue = 2;

    return returnValue;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSUInteger returnValue = 0;
    returnValue = self.searchedItems.count;
    return returnValue;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if (indexPath.section == 0) {
        // artist
        SNArtist *artist = (SNArtist *)[self.searchedItems objectAtIndex:indexPath.row];
        cell.textLabel.text = artist.name;

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
    SNArtistViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"snartist"];
    vc.artist = [self.searchedItems objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
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

#pragma mark - scrollview delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x == 0) {
        self.segment.selectedSegmentIndex = 0;
    } else if (scrollView.contentOffset.x >= 320){
        self.segment.selectedSegmentIndex = 1;
    }
}

#pragma mark - segmentedControl method

- (IBAction)segmentedControlPressed:(id)sender
{
    UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
    CGPoint destination;
    switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            destination = CGPointMake(0, 0);
            break;
        case 1:
            destination = CGPointMake(self.scrollView.contentSize.width / 2, 0);
            break;
    }
    float duration = 0.3f;
    [UIView animateWithDuration:duration animations:^ {
        [self.scrollView setContentOffset:destination animated:NO];
    }];
}
@end
