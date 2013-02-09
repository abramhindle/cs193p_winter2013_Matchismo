//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Rob Freiburger on 2/9/13.
//  Copyright (c) 2013 Rob Freiburger. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

// Private instance methods
@property (strong, nonatomic) NSMutableArray *cards;
@property (nonatomic) int score;

@end

@implementation CardMatchingGame

- (NSMutableArray *)cards {
	if (!_cards) {
		_cards = [[NSMutableArray alloc] init];
	}
	
	return _cards;
}

- (id)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck {
	self = [super init];
	
	if (self) {
		for (int i = 0; i < count; i++) {
			Card *card = [deck drawRandomCard];
			
			if (!card) {
				self = nil;
			} else {
				self.cards[i] = card;
			}
		}
	}
	
	return self;
}

- (Card *)cardAtIndex:(NSUInteger)index {
	return (index < self.cards.count) ? self.cards[index] : nil;
}

@end