//
//  CardGameNavigationController.m
//  Matchuro
//
//  Created by Glenn Yonemitsu on 12/31/13.
//  Copyright (c) 2013 Glenn Yonemitsu. All rights reserved.
//

#import "CardGameNavigationController.h"
#import "CardGameLogViewController.h"

@interface CardGameNavigationController ()

@end

@implementation CardGameNavigationController

- (void)showGameLog:(MatchingGame *)game {
    CardGameLogViewController *logViewController = [[CardGameLogViewController alloc] init];
    logViewController.title = @"Game Log";
    logViewController.log = game.log;
    
    [self pushViewController:logViewController animated:YES];
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
