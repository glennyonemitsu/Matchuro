//
//  CardGameViewController.h
//  Matchuro
//
//  Created by Glenn Yonemitsu on 12/25/13.
//  Copyright (c) 2013 Glenn Yonemitsu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MatchingGame.h"
#import "CardControl.h"

@interface CardGameViewController : UIViewController

@property (strong, nonatomic) UILabel *scoreLabel;
@property (strong, nonatomic) UIButton *resetGameButton;
@property (strong, nonatomic) MatchingGame *game;
@property (strong, nonatomic) NSMutableArray *cardControls; // CardControl

- (void)cardClicked:(CardControl *)cardControl;
- (void)setupGameControls;
- (void)setupCardControls;
- (void)fillCardControls;
- (Deck *)createNewDeck;
- (MatchingGame *)createNewGame;
- (void)startNewGame;
- (void)updateUI;
- (CGRect)makeFrameForIndex:(NSUInteger)index;
- (CardControl *)createCardControl:(NSUInteger)index;
- (void)showGameLog;

@end
