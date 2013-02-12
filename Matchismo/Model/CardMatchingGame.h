//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Rob Freiburger on 2/9/13.
//  Copyright (c) 2013 Rob Freiburger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

// Public instance methods
- (id)initWithCardCount:(NSUInteger)cardCount
							usingDeck:(Deck *)deck;
- (void)flipCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) int score;

// Results after flipping a card.
@property (nonatomic, readonly) NSString *results;

@end