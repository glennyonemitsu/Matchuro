//
//  Card.h
//  Matchuro
//
//  Created by Glenn Yonemitsu on 12/25/13.
//  Copyright (c) 2013 Glenn Yonemitsu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

// unique identifier for game grid
@property (nonatomic) NSUInteger index;
@property (nonatomic, getter = isChosen) BOOL chosen;
@property (nonatomic, getter = isMatched) BOOL matched;

- (NSString *)contents;
- (int)match:(NSArray *)otherCards;

@end
