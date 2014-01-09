//
//  MatchingGame.m
//  Matchuro
//
//  Created by Glenn Yonemitsu on 12/25/13.
//  Copyright (c) 2013 Glenn Yonemitsu. All rights reserved.
//

#import "MatchingGame.h"


@interface MatchingGame ()

@end


@implementation MatchingGame

- (NSInteger)ruleMinimumSelection {
    return 2;
}

- (NSInteger)ruleCostToChoose {
    return -1;
}

- (NSInteger)ruleMatchBonus {
    return 4;
}

- (NSInteger)ruleMismatchPenalty {
    return -2;
}

- (NSMutableArray *)cards {
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck {
    self = [super init];
    if (self) {
        self.selectedCards = [[NSMutableArray alloc] init];
        for (NSUInteger i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    return self;
}

- (void)chooseCardAtIndex:(NSUInteger)index {
    Card *card = [self cardAtIndex:index];
    NSLog(@"Card chosen, %@", card.contents);
    if (!card.isMatched) {
        if (card.isChosen) {
            [self.selectedCards removeObject:card];
        } else {
            
            // pop from stack if space is needed
            if ([self.selectedCards count] >= [self ruleMinimumSelection]) {
                Card *lastCard = [self.selectedCards firstObject];
                lastCard.chosen = NO;
                [self.selectedCards removeObject:lastCard];
            }
            
            // match against another card or cards
            int matchScore = [card match:self.selectedCards];
            
            // we got a match. Add score and disable ALL cards as per rules
            if (matchScore) {
                self.score += matchScore * [self ruleMatchBonus];
                card.matched = YES;
                for (Card *oldCard in self.selectedCards) {
                    oldCard.matched = YES;
                }
                self.selectedCards = [[NSMutableArray alloc] init];
                
                // nothing happened, so we push to stack
            } else {
                [self.selectedCards addObject:card];
                self.score += [self ruleMismatchPenalty];
            }
            
            self.score += [self ruleCostToChoose];
        }
        card.chosen = !card.isChosen;
    }
}

- (Card *)cardAtIndex:(NSUInteger)index {
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

@end
