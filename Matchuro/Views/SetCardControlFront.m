//
//  SetCardControlFront.m
//  Matchuro
//
//  Created by Glenn Yonemitsu on 12/30/13.
//  Copyright (c) 2013 Glenn Yonemitsu. All rights reserved.
//

#import "SetCardControlFront.h"

@implementation SetCardControlFront

+ (void)drawShape:(NSString *)shape inRect:(CGRect)rect {
    if ([shape isEqualToString:@"diamond"]) {
        [SetCardControlFront drawDiamond:rect];
    }
    else if ([shape isEqualToString:@"square"]) {
        [SetCardControlFront drawSquare:rect];
    }
    else if ([shape isEqualToString:@"triangle"]) {
        [SetCardControlFront drawTriangle:rect];
    }
}

+ (void)drawDiamond:(CGRect)rect {
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGPoint pointOne = CGPointMake(rect.origin.x + (rect.size.width / 2), rect.origin.y);
    CGPoint pointTwo = CGPointMake(rect.origin.x + rect.size.width, rect.origin.y + (rect.size.height / 2));
    CGPoint pointThree = CGPointMake(rect.origin.x + (rect.size.width / 2), rect.origin.y + rect.size.height);
    CGPoint pointFour = CGPointMake(rect.origin.x, rect.origin.y + (rect.size.height / 2));
    
    [path moveToPoint:pointOne];
    [path addLineToPoint:pointTwo];
    [path addLineToPoint:pointThree];
    [path addLineToPoint:pointFour];
    [path fill];
    [path stroke];
    [path closePath];
}

+ (void)drawSquare:(CGRect)rect {
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGPoint pointOne = CGPointMake(rect.origin.x, rect.origin.y);
    CGPoint pointTwo = CGPointMake(rect.origin.x + rect.size.width, rect.origin.y);
    CGPoint pointThree = CGPointMake(rect.origin.x + rect.size.width, rect.origin.y + rect.size.height);
    CGPoint pointFour = CGPointMake(rect.origin.x, rect.origin.y + rect.size.height);
    
    [path moveToPoint:pointOne];
    [path addLineToPoint:pointTwo];
    [path addLineToPoint:pointThree];
    [path addLineToPoint:pointFour];
    [path fill];
    [path stroke];
    [path closePath];
}

+ (void)drawTriangle:(CGRect)rect {
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGPoint pointOne = CGPointMake(rect.origin.x + (rect.size.width / 2), rect.origin.y);
    CGPoint pointTwo = CGPointMake(rect.origin.x + rect.size.width, rect.origin.y + rect.size.height);
    CGPoint pointThree = CGPointMake(rect.origin.x, rect.origin.y + rect.size.height);
    
    [path moveToPoint:pointOne];
    [path addLineToPoint:pointTwo];
    [path addLineToPoint:pointThree];
    [path fill];
    [path stroke];
    [path closePath];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    if ([self.card.color isEqualToString:@"red"]) {
        [[UIColor redColor] setStroke];
        [[UIColor redColor] setFill];
    }
    else if ([self.card.color isEqualToString:@"green"]) {
        [[UIColor greenColor] setStroke];
        [[UIColor greenColor] setFill];
    }
    else if ([self.card.color isEqualToString:@"blue"]) {
        [[UIColor blueColor] setStroke];
        [[UIColor blueColor] setFill];
    }

    // start calculating size of images to draw

    CGFloat padding = 6.0;

    NSInteger paddingTax = [self.card.count integerValue] + 1;
    NSInteger count = [self.card.count integerValue];
    
    CGFloat dimension = (self.frame.size.width - (padding * paddingTax)) / count;

    if (count == 1) {
        CGRect rect = CGRectMake(padding, padding, dimension, dimension);
        [SetCardControlFront drawShape:self.card.shape inRect:rect];
    }
    else if (count == 2) {
        CGFloat offsetY = (self.frame.size.height - dimension) / 2;
        CGFloat offsetXone = padding;
        CGFloat offsetXtwo = padding + dimension + padding;
        [SetCardControlFront drawShape:self.card.shape inRect:CGRectMake(offsetXone, offsetY, dimension, dimension)];
        [SetCardControlFront drawShape:self.card.shape inRect:CGRectMake(offsetXtwo, offsetY, dimension, dimension)];
    }
    else if (count == 3) {
        for (NSInteger i = 1; i <= count; i++) {
            CGFloat offset = (padding * i) + (dimension * (i - 1));
            [SetCardControlFront drawShape:self.card.shape inRect:CGRectMake(offset, offset, dimension, dimension)];
        }
    }

}

@end
