//
//  SNViewController.m
//  SuperNova
//
//  Created by 清 貴幸 on 2013/12/21.
//  Copyright (c) 2013年 清 貴幸. All rights reserved.
//

#import "SNViewController.h"
#import "SNMusicLibrary.h"
#import "SNArtist.h"

@interface SNViewController ()

@end

@implementation SNViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    SNMusicLibrary *ml = [[SNMusicLibrary alloc] init];
    self.artists = [ml getArtistsByLibrary];
    for (id item in self.artists) {
        UIImage *img = [item valueForKey:@"artwork"];
        NSString *name = [item valueForKey:@"name"];
        NSLog(@"name = %@ artwork = %@", name, img);
    }
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.artists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    SNArtist *artist = [self.artists objectAtIndex:indexPath.row];
    
    cell.textLabel.text = artist.name;
    cell.imageView.image = artist.artwork;
    
    // Configure the cell...
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}


- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    [self.artistTableView setEditing:editing animated:animated];
}


@end
