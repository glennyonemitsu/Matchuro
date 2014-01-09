//
//  SetCardDeck.m
//  Matchuro
//
//  Created by Glenn Yonemitsu on 12/30/13.
//  Copyright (c) 2013 Glenn Yonemitsu. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"

@implementation SetCardDeck

- (instancetype)init {
    self = [super init];
    if (self) {
        for (NSString *color in [SetCard validColors]) {
            for (NSNumber *count in [SetCard validCounts]) {
                for (NSString *shape in [SetCard validShapes]) {
                    SetCard *card = [[SetCard alloc] init];
                    card.color = color;
                    card.count = count;
                    card.shape = shape;
                    [self addCard:card];
                }
            }
        }
    }
    return self;
}

@end
