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

@end

@implementation CardMatchingGame

- (NSMutableArray *)cards {
	if (!_cards) {
		_cards = [[NSMutableArray alloc] init];
	}
	
	return _cards;
}

@end