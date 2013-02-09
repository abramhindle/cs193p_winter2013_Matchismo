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

- (void)flipCardAtIndex:(NSUInteger)index {
	Card *card = [self cardAtIndex:index];
	
	if (!card.isUnplayable) {
		if (!card.isFaceUp) {
			// see if flipping this card up creates a match
			for (Card *otherCard in self.cards) {
				if (otherCard.isFaceUp && !otherCard.isUnplayable) {
					int matchScore = [card match:@[otherCard]];
					
					if (matchScore) {
						otherCard.unplayable = YES;
						card.unplayable = YES;
						self.score += matchScore;
					}
				}
			}
		}
		
		card.faceUp = !card.isFaceUp;
	}
}

@end