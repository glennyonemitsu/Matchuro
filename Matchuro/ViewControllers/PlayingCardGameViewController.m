//
//  PlayingCardGameViewController.m
//  Matchuro
//
//  Created by Glenn Yonemitsu on 12/25/13.
//  Copyright (c) 2013 Glenn Yonemitsu. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"
#import "PlayingCardControl.h"
#import "PlayingCardMatchingGame.h"

@interface PlayingCardGameViewController ()

@end

@implementation PlayingCardGameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Playing Card Game";
        self.view.backgroundColor = [UIColor grayColor];
    }
    return self;
}

- (PlayingCardDeck *)createNewDeck {
    return [[PlayingCardDeck alloc] init];
}

- (PlayingCardControl *)createCardControl:(NSUInteger)index {
    return [[PlayingCardControl alloc] initWithIndex:index];
}

- (PlayingCardMatchingGame *)createNewGame {
    PlayingCardDeck *deck = (PlayingCardDeck *)[self createNewDeck];
    return [[PlayingCardMatchingGame alloc] initWithCardCount:16 usingDeck:deck];
}

@end
