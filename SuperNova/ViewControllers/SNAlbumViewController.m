//
//  SNAlbumViewController.m
//  SuperNova
//
//  Created by 清 貴幸 on 2014/01/06.
//  Copyright (c) 2014年 清 貴幸. All rights reserved.
//

#import "SNAlbumViewController.h"
#import "SNTrack.h"
#import "CAKeyframeAnimation+AHEasing.h"

#define SCALE 0.8f

@interface SNAlbumViewController ()

@end

@implementation SNAlbumViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.albumTitleLabel.text = self.album.name;
    self.tracks = [[NSMutableArray alloc] init];
    self.artworkImageView.image = self.album.artwork;
    [SNTrack getTracksByCollectionid:self.album.collectionId
                             success:^(AFHTTPRequestOperation *operation, id responseObject) {
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

# pragma mark - animation methods

- (void)animateShrinkDuration:(float)duration
{
    CAAnimationGroup *animationGroup = [[CAAnimationGroup alloc] init];
    
    CAKeyframeAnimation *widthAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.x"
                                                                           function:LinearInterpolation
                                                                          fromValue:1.0f
                                                                            toValue:SCALE];
    
    CAKeyframeAnimation* heightAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.y"
                                                                            function:LinearInterpolation
                                                                           fromValue:1.0f
                                                                             toValue:SCALE];
    
    animationGroup.animations = [[NSArray alloc] initWithObjects:widthAnimation, heightAnimation, nil];
    animationGroup.fillMode = kCAFillModeForwards;
    animationGroup.removedOnCompletion = NO;
    animationGroup.duration = duration;
    animationGroup.repeatCount = 1;
    
    [self.onContentsView.layer addAnimation:animationGroup
                                     forKey:@"shrink"];
}

- (void)animateBulgeDuration:(float)duration
{
    CAAnimationGroup *animationGroup = [[CAAnimationGroup alloc] init];
    
    CAKeyframeAnimation *widthAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.x"
                                                                           function:LinearInterpolation
                                                                          fromValue:SCALE
                                                                            toValue:1.0f];
    
    CAKeyframeAnimation* heightAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.y"
                                                                            function:LinearInterpolation
                                                                           fromValue:SCALE
                                                                             toValue:1.0f];
    
    animationGroup.animations = [[NSArray alloc] initWithObjects:widthAnimation, heightAnimation, nil];
    animationGroup.fillMode = kCAFillModeForwards;
    animationGroup.removedOnCompletion = NO;
    animationGroup.duration = duration;
    animationGroup.repeatCount = 1;
    
    [self.onContentsView.layer addAnimation:animationGroup
                                     forKey:@"bulge"];
}

@end
