//
//  Deck.m
//  Matchismo
//
//  Created by Rob Freiburger on 2/4/13.
//  Copyright (c) 2013 Rob Freiburger. All rights reserved.
//

#import "Deck.h"

@interface Deck()

// Private instance variables
@property (strong, nonatomic) NSMutableArray *cards;

@end

@implementation Deck

- (NSMutableArray *)cards
{
	if (!_cards) {
		_cards = [[NSMutableArray alloc] init];
	}
	
	return _cards;
}

- (void)addCard:(Card *)card atTop:(BOOL)atTop {
	if (atTop) {
		[self.cards insertObject:card atIndex:0];
	} else {
		[self.cards addObject:card];
	}
}

- (Card *)drawRandomCard {
	Card *randomCard = nil;
	
	if (self.cards.count) {
		unsigned index = arc4random() % self.cards.count;
		randomCard = self.cards[index];
		[self.cards removeObjectAtIndex:index];
	}
	
	return randomCard;
}

@end
