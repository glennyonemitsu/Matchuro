//
//  CardGameViewController.m
//  Matchuro
//
//  Created by Glenn Yonemitsu on 12/25/13.
//  Copyright (c) 2013 Glenn Yonemitsu. All rights reserved.
//

#import "CardGameViewController.h"
#import "CardControl.h"
#import "CardGameNavigationController.h"

@interface CardGameViewController ()


@end

@implementation CardGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateUI];
}

- (NSMutableArray *)cardControls {
    if (!_cardControls) {
        _cardControls = [[NSMutableArray alloc] init];
    }
    return _cardControls;
}

- (void)setupGameControls {
    CGSize parentSize = self.view.frame.size;
    
    // setup new game button
    CGRect resetGameButtonLocation = CGRectMake(parentSize.width - 116, parentSize.height - 96, 100, 30);
    UIButton *resetGameButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    resetGameButton.frame = resetGameButtonLocation;
    resetGameButton.backgroundColor = [UIColor blueColor];
    [resetGameButton setTitle:@"New Game" forState:UIControlStateNormal];
    [resetGameButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [resetGameButton addTarget:self
                        action:@selector(startNewGame)
              forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:resetGameButton];
    
    // setup score label
    self.scoreLabel = [[UILabel alloc] init];
    self.scoreLabel.frame = CGRectMake(16, parentSize.height - 96, 100, 30);
    self.scoreLabel.text = @"Score: 0";
    self.scoreLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [self.view addSubview:self.scoreLabel];
    
}

- (void)fillCardControls {
    for (int i = 0; i < 16; i++) {
        CardControl *cardControl = [self.cardControls objectAtIndex:i];
        cardControl.card = [self.game cardAtIndex:i];
        [cardControl createControlFrontView];
    }
}

- (CardControl *)createCardControl:(NSUInteger)index {
    return [[CardControl alloc] initWithIndex:index];
}

- (void)setupCardControls {
    for (int i = 0; i < 16; i++) {
        CardControl *card = [self createCardControl:i];
        card.bounds = CGRectMake(0, 0, 64, 64);
        card.frame = [self makeFrameForIndex:i];
        card.backgroundColor = [UIColor whiteColor];
        [card addTarget:self action:@selector(cardClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.cardControls addObject:card];
        [self.view addSubview:card];
    }
}

- (void)cardClicked:(CardControl *)cardControl {
    [self.game chooseCardAtIndex:cardControl.index];
    [self updateUI];
}

- (Deck *)createNewDeck {
    return nil;
}

- (MatchingGame *)createNewGame {
    Deck *deck = [self createNewDeck];
    return [[MatchingGame alloc] initWithCardCount:16 usingDeck:deck];
}

- (void)startNewGame {
    self.game = [self createNewGame];
    [self fillCardControls];
    for (CardControl *cardControl in self.cardControls) {
        cardControl.card.matched = NO;
        cardControl.card.chosen = NO;
    }
    [self updateUI];
}

- (void)updateUI {
    for (CardControl *cardControl in self.cardControls) {
        cardControl.front.hidden = !cardControl.card.isChosen;
        cardControl.back.hidden = cardControl.card.isChosen;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
}

- (void)showGameLog {
    [(CardGameNavigationController *)self.navigationController showGameLog:self.game];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithTitle:@"Log"
                                                                       style:UIBarButtonItemStyleBordered
                                                                      target:self
                                                                      action:@selector(showGameLog)];
        self.navigationItem.rightBarButtonItem = buttonItem;
        
        self.title = @"Card Game";
        [self setupGameControls];
        [self setupCardControls];
        [self startNewGame];
    }
    return self;
}

- (CGRect)makeFrameForIndex:(NSUInteger)index {
    int row = index / 4;
    int col = index % 4;
    int frameY = 80 + (74 * row);
    int frameX = 16 + (74 * col);
    return CGRectMake(frameX, frameY, 64, 64);
}

@end
