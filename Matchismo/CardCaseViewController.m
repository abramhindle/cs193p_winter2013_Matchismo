//
//  CardCaseViewController.m
//  Matchismo
//
//  Created by Rob Freiburger on 2/4/13.
//  Copyright (c) 2013 Rob Freiburger. All rights reserved.
//

#import "CardCaseViewController.h"
#import "Model/PlayingCardDeck.h"
#import "Model/CardMatchingGame.h"

@interface CardCaseViewController ()

// UI Elements
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultsLabel;

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

- (void)updateUI {
	for (UIButton *cardButton in self.cardButtons) {
    Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
		
		[cardButton setTitle:card.contents
								forState:UIControlStateSelected];
		[cardButton setTitle:card.contents
								forState:UIControlStateSelected|UIControlStateDisabled];
		
		cardButton.selected = card.isFaceUp;
		cardButton.enabled = !card.isUnplayable;
		cardButton.alpha = card.isUnplayable ? 0.3 : 1.0;
	}
	
	self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
	self.resultsLabel.text = self.game.results;
}

- (void)setCardButtons:(NSArray *)cardButtons {
	_cardButtons = cardButtons;
	
	[self updateUI];
}

- (IBAction)flipCard:(UIButton *)sender {
	[self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
	self.flipCount++;
	
	[self updateUI];
}

- (IBAction)dealNewGame {
	self.game = nil;
	self.flipCount = 0;
	
	[self updateUI];
}

@end