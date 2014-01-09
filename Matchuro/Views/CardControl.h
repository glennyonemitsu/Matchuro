//
//  CardControl.h
//  Matchuro
//
//  Created by Glenn Yonemitsu on 12/25/13.
//  Copyright (c) 2013 Glenn Yonemitsu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Card.h"

@interface CardControl : UIControl

@property (strong, nonatomic) Card *card;
@property (strong, nonatomic) UIImageView *back;
@property (strong, nonatomic) UIView *front;
@property (nonatomic, getter = isFaceUp) BOOL faceUp;
@property (nonatomic) NSUInteger index;

- (instancetype)initWithIndex:(NSUInteger)index;
- (void)createControlFrontView;
- (void)createControlBackView;

@end
