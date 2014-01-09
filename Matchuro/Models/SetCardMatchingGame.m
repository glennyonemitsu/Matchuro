//
//  SetCardMatchingGame.m
//  Matchuro
//
//  Created by Glenn Yonemitsu on 12/30/13.
//  Copyright (c) 2013 Glenn Yonemitsu. All rights reserved.
//

#import "SetCardMatchingGame.h"

@implementation SetCardMatchingGame

- (NSInteger)ruleMinimumSelection {
    return 3;
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

@end
