//
//  PlayingCardControl.m
//  Matchuro
//
//  Created by Glenn Yonemitsu on 12/30/13.
//  Copyright (c) 2013 Glenn Yonemitsu. All rights reserved.
//

#import "PlayingCardControl.h"

@implementation PlayingCardControl

- (void)createControlFrontView {
    [super createControlFrontView];
    UILabel *front = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 64, 64)];
    front.text = self.card.contents;
    front.textAlignment = NSTextAlignmentCenter;
    self.front = front;
    [self addSubview:self.front];
}

@end
