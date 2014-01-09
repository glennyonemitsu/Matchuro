//
//  CardGameNavigationController.m
//  Matchuro
//
//  Created by Glenn Yonemitsu on 12/31/13.
//  Copyright (c) 2013 Glenn Yonemitsu. All rights reserved.
//

#import "CardGameNavigationController.h"

@interface CardGameNavigationController ()

@end

@implementation CardGameNavigationController

- (void)showGameLog:(MatchingGame *)game {
    NSLog(@"game log %@", game);
    UIViewController *newView = [[UIViewController alloc] init];
    newView.title = @"some view";
    
    [self pushViewController:newView animated:YES];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
