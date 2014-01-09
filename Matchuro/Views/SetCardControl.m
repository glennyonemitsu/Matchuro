//
//  SetCardControl.m
//  Matchuro
//
//  Created by Glenn Yonemitsu on 12/30/13.
//  Copyright (c) 2013 Glenn Yonemitsu. All rights reserved.
//

#import "SetCardControl.h"
#import "SetCardControlFront.h"

@implementation SetCardControl

- (void)createControlFrontView {
    [super createControlFrontView];
    SetCardControlFront *front = [[SetCardControlFront alloc] initWithFrame:CGRectMake(0, 0, 64, 64)];
    front.backgroundColor = [UIColor whiteColor];
    front.card = (SetCard *)self.card;

    self.front = front;
    [self addSubview:self.front];
}

@end
