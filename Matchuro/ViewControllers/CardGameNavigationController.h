//
//  CardGameNavigationController.h
//  Matchuro
//
//  Created by Glenn Yonemitsu on 12/31/13.
//  Copyright (c) 2013 Glenn Yonemitsu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MatchingGame.h"

@interface CardGameNavigationController : UINavigationController

- (void)showGameLog:(MatchingGame *)game;

@end
