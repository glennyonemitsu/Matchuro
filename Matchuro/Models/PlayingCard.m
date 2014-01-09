//
//  PlayingCard.m
//  Matchuro
//
//  Created by Glenn Yonemitsu on 12/25/13.
//  Copyright (c) 2013 Glenn Yonemitsu. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit;

- (NSString *)contents {
    NSArray *ranks = [PlayingCard validRanks];
    NSString *rank = ranks[self.rank];
    return [NSString stringWithFormat:@"%@%@", rank, self.suit];
}

- (NSString *)suit {
    return _suit ? _suit : @"?";
}

- (void)setSuit:(NSString *)suit {
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (void)setRank:(NSUInteger)rank {
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

- (int)match:(NSArray *)otherCards {
    int score = 0;
    for (PlayingCard *card in otherCards) {
        if (card.rank == self.rank) {
            score += 4;
        }
        if ([card.suit isEqualToString:self.suit]) {
            score += 1;
        }
    }
    return score;
}

+ (NSUInteger)maxRank {
    return 13;
}

+ (NSArray *)validSuits {
    return @[@"♦️", @"♣️", @"♥️", @"♠️"];
}

+ (NSArray *)validRanks {
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

@end
