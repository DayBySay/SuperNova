//
//  SNViewController.m
//  SuperNova
//
//  Created by 清 貴幸 on 2013/12/21.
//  Copyright (c) 2013年 清 貴幸. All rights reserved.
//

#import "SNViewController.h"
#import "SNMusicLibrary.h"
@interface SNViewController ()

@end

@implementation SNViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    SNMusicLibrary *ml = [[SNMusicLibrary alloc] init];
    NSArray *artists = [ml getArtistsByLibrary];
    
    for (id item in artists) {
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

@end
