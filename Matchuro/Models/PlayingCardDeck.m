//
//  PlayingCardDeck.m
//  Matchuro
//
//  Created by Glenn Yonemitsu on 12/25/13.
//  Copyright (c) 2013 Glenn Yonemitsu. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck


- (instancetype)init {
    self = [super init];

    for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++) {
        for (NSString *suit in [PlayingCard validSuits]) {
            PlayingCard *card = [[PlayingCard alloc] init];
            card.suit = suit;
            card.rank = rank;
            [self addCard:card];
        }
    }
    return self;
}

@end
