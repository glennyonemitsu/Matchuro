//
//  CardControl.m
//  Matchuro
//
//  Created by Glenn Yonemitsu on 12/25/13.
//  Copyright (c) 2013 Glenn Yonemitsu. All rights reserved.
//

#import "CardControl.h"

@implementation CardControl

- (void)createControlFrontView {
    if (self.front != nil) {
        [self.front removeFromSuperview];
        self.front = nil;
    }
}

- (void)createControlBackView {
    self.back = [[UIImageView alloc] init];
    self.back.frame = CGRectMake(0, 0, 64, 64);
    self.back.image = [UIImage imageNamed:@"cardBack"];
}

- (instancetype)initWithIndex:(NSUInteger)index {
    self = [super init];
    if (self) {
        self.faceUp = NO;
        self.index = index;
        [self createControlBackView];
        [self addSubview:self.back];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
