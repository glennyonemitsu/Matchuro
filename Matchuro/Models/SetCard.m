//
//  SetCard.m
//  Matchuro
//
//  Created by Glenn Yonemitsu on 12/30/13.
//  Copyright (c) 2013 Glenn Yonemitsu. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

+ (NSArray *)validColors {
    return @[@"red", @"green", @"blue"];
}
+ (NSArray *)validCounts {
    return @[@1, @2, @3];
}
+ (NSArray *)validShapes {
    return @[@"diamond", @"square", @"triangle"];
}

- (NSString *)contents {
    return [NSString stringWithFormat:@"%@ %@ %@", self.count, self.color, self.shape];
}

- (int)match:(NSArray *)otherCards {
    int score = 0;
    if ([otherCards count] == 2) {
        NSMutableSet *colorSet = [[NSMutableSet alloc] init];
        NSMutableSet *countSet = [[NSMutableSet alloc] init];
        NSMutableSet *shapeSet = [[NSMutableSet alloc] init];
        
        NSMutableArray *cards = [[NSMutableArray alloc] initWithArray:otherCards];
        [cards addObject:self];
        
        for (SetCard *card in cards) {
            [colorSet addObject:card.color];
            [countSet addObject:card.count];
            [shapeSet addObject:card.shape];
        }
        
        // counts of 1 (same) or 3 (all different) are good matches, so look for 2
        if ([colorSet count] != 2 && [countSet count] != 2 && [shapeSet count] != 2) {
            score += 9;
        }

    }
    return score;
}

@end
