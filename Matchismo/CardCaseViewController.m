//
//  CardCaseViewController.m
//  Matchismo
//
//  Created by Rob Freiburger on 2/4/13.
//  Copyright (c) 2013 Rob Freiburger. All rights reserved.
//

#import "CardCaseViewController.h"
#import "Model/PlayingCardDeck.h"

@interface CardCaseViewController ()

// UI Elements
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;

// Instance variables
@property (strong, nonatomic) PlayingCardDeck *playingDeck;
@property (nonatomic) int flipCount;

@end

@implementation CardCaseViewController

- (void)setFlipCount:(int)flipCount {
	_flipCount = flipCount;
	self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (PlayingCardDeck *)playingDeck {
	if (!_playingDeck) {
		_playingDeck = [[PlayingCardDeck alloc] init];
	}
	
	return _playingDeck;
}

- (IBAction)flipCard:(UIButton *)sender {
	// Set card if selected.
	if (sender.selected) {
		[sender setTitle:[self.playingDeck drawRandomCard].contents
						forState:UIControlStateSelected];
	}
	
	sender.selected = !sender.isSelected;
	self.flipCount++;
}

@end
