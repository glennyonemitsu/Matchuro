//
//  CardGameLogViewController.m
//  Matchuro
//
//  Created by Glenn Yonemitsu on 1/10/14.
//  Copyright (c) 2014 Glenn Yonemitsu. All rights reserved.
//

#import "CardGameLogViewController.h"

@interface CardGameLogViewController ()

@end

@implementation CardGameLogViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSMutableString *logText = [[NSMutableString alloc] init];
    for (NSString *entry in self.log) {
        [logText appendString:entry];
        [logText appendString:@"\n"];
    }
    
    UITextView *logTextView = [[UITextView alloc] initWithFrame:self.view.frame];
    logTextView.editable = NO;
    logTextView.contentInset = UIEdgeInsetsMake(16, 16, 16, 16);
    logTextView.text = logText;
    [self.view addSubview:logTextView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
