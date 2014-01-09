//
//  SetCardGameViewController.m
//  Matchuro
//
//  Created by Glenn Yonemitsu on 12/25/13.
//  Copyright (c) 2013 Glenn Yonemitsu. All rights reserved.
//

#import "SetCardGameViewController.h"
#import "SetCardControl.h"
#import "SetCardDeck.h"
#import "SetCardMatchingGame.h"

@interface SetCardGameViewController ()

@end

@implementation SetCardGameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Set Card Game";
    }
    return self;
}

- (SetCardDeck *)createNewDeck {
    return [[SetCardDeck alloc] init];
}

- (SetCardControl *)createCardControl:(NSUInteger)index {
    return [[SetCardControl alloc] initWithIndex:index];
}

- (SetCardMatchingGame *)createNewGame {
    SetCardDeck *deck = (SetCardDeck *)[self createNewDeck];
    return [[SetCardMatchingGame alloc] initWithCardCount:16 usingDeck:deck];
}

@end
