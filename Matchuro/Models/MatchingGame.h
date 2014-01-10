//
//  MatchingGame.h
//  Matchuro
//
//  Created by Glenn Yonemitsu on 12/25/13.
//  Copyright (c) 2013 Glenn Yonemitsu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface MatchingGame : NSObject

@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; // of Card

@property (nonatomic, strong) NSMutableArray *log; // NSString
@property (nonatomic, strong) NSMutableArray *selectedCards; // of CardGameCard (FIFO)

- (NSInteger)ruleMinimumSelection;
- (NSInteger)ruleCostToChoose;
- (NSInteger)ruleMatchBonus;
- (NSInteger)ruleMismatchPenalty;

// designated initializer
- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck;
- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;
- (void)addLog:(NSString *)message;
//- (void)clearLog;

@end
