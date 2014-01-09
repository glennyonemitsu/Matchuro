//
//  SetCard.h
//  Matchuro
//
//  Created by Glenn Yonemitsu on 12/30/13.
//  Copyright (c) 2013 Glenn Yonemitsu. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

@property (strong, nonatomic) NSString *color;
@property (strong, nonatomic) NSNumber *count;
@property (strong, nonatomic) NSString *shape;

+ (NSArray *)validColors;
+ (NSArray *)validCounts;
+ (NSArray *)validShapes;


@end
