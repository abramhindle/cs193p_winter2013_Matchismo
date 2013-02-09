//
//  CardCaseViewController.m
//  Matchismo
//
//  Created by Rob Freiburger on 2/4/13.
//  Copyright (c) 2013 Rob Freiburger. All rights reserved.
//

#import "CardCaseViewController.h"
#import "Model/PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardCaseViewController ()

// UI Elements
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

// Instance variables
@property (strong, nonatomic) CardMatchingGame *game;
@property (nonatomic) int flipCount;

@end

@implementation CardCaseViewController

- (void)setFlipCount:(int)flipCount {
	_flipCount = flipCount;
	self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (CardMatchingGame *)game {
	if (!_game) {
		_game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count
																							usingDeck:[[PlayingCardDeck alloc] init]];
	}
	
	return _game;
}

- (void)setCardButtons:(NSArray *)cardButtons {
	_cardButtons = cardButtons;
}

- (IBAction)flipCard:(UIButton *)sender {
	[self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
	self.flipCount++;
}

@end