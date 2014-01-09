//
//  MatchuroTabBarViewController.m
//  Matchuro
//
//  Created by Glenn Yonemitsu on 12/25/13.
//  Copyright (c) 2013 Glenn Yonemitsu. All rights reserved.
//

#import "MatchuroTabBarViewController.h"
#import "PlayingCardGameViewController.h"
#import "SetCardGameViewController.h"
#import "CardGameNavigationController.h"

@interface MatchuroTabBarViewController ()

@end

@implementation MatchuroTabBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        CardGameNavigationController *playingCardGame = [[CardGameNavigationController alloc] initWithRootViewController:[[PlayingCardGameViewController alloc] init]];
        CardGameNavigationController *setCardGame = [[CardGameNavigationController alloc] initWithRootViewController:[[SetCardGameViewController alloc] init]];
        self.viewControllers = @[playingCardGame, setCardGame];
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
