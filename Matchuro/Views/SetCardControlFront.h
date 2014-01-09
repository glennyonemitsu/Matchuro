//
//  SetCardControlFront.h
//  Matchuro
//
//  Created by Glenn Yonemitsu on 12/30/13.
//  Copyright (c) 2013 Glenn Yonemitsu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SetCard.h"

@interface SetCardControlFront : UIView

@property (strong, nonatomic) SetCard *card;

+ (void)drawShape:(NSString *)shape inRect:(CGRect)rect;

+ (void)drawDiamond:(CGRect)rect;

+ (void)drawSquare:(CGRect)rect;

+ (void)drawTriangle:(CGRect)rect;

@end
