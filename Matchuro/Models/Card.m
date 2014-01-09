//
//  Card.m
//  Matchuro
//
//  Created by Glenn Yonemitsu on 12/25/13.
//  Copyright (c) 2013 Glenn Yonemitsu. All rights reserved.
//

#import "Card.h"

@implementation Card

- (BOOL)isMatched {
    if (!_matched) {
        _matched = NO;
    }
    return _matched;
}

- (NSString *)contents {
    return @"";
}

- (int)match:(NSArray *)otherCards {
    int score = 0;
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score += 1;
        }
    }
    return score;
}

@end
