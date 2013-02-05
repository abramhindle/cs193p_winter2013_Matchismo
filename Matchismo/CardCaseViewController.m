//
//  CardCaseViewController.m
//  Matchismo
//
//  Created by Rob Freiburger on 2/4/13.
//  Copyright (c) 2013 Rob Freiburger. All rights reserved.
//

#import "CardCaseViewController.h"

@interface CardCaseViewController ()

// UI Elements
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;

// Instance variables
@property (nonatomic) int flipCount;

@end

@implementation CardCaseViewController

- (void)setFlipCount:(int)flipCount {
	_flipCount = flipCount;
	self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (IBAction)flipCard:(UIButton *)sender {
	sender.selected = !sender.isSelected;
	
	self.flipCount++;
}

@end
