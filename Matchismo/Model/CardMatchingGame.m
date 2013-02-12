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
@property (strong, nonatomic) NSString *results;

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
		for (int i = 0; i < cardCount; i++) {
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

#define FLIP_COST 1
#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2

- (void)flipCardAtIndex:(NSUInteger)index {
	Card *card = [self cardAtIndex:index];
	int points = 0;

	if (!card.isUnplayable) {
		if (!card.isFaceUp) {
			// see if flipping this card up creates a match
			for (Card *otherCard in self.cards) {
				if (otherCard.isFaceUp && !otherCard.isUnplayable) {
					int matchScore = [card match:@[otherCard]];
					
					if (matchScore) {
						otherCard.unplayable = YES;
						card.unplayable = YES;
						
						points = matchScore * MATCH_BONUS;
						self.score += points;
						
						self.results = [NSString stringWithFormat:@"Matched %@ and %@ for %d points!", card.contents, otherCard.contents, points];
					} else {
						otherCard.faceUp = NO;
						
						points = MISMATCH_PENALTY;
						self.score -= points;
						
						self.results = [NSString stringWithFormat:@"%@ and %@ don't match! %d point penalty!", card.contents, otherCard.contents, points];
					}
					
					break;
				}
			}
			
			self.score -= FLIP_COST;
			
			if (points == 0) {
				self.results = [NSString stringWithFormat:@"Flipped up %@", card.contents];
			}
		}
		
		card.faceUp = !card.isFaceUp;
	}
}

@end