//
//  PlayingCard.h
//  Matchismo
//
//  Created by Rob Freiburger on 2/4/13.
//  Copyright (c) 2013 Rob Freiburger. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

// Public instance methods
@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

// Public class methods
+ (NSArray *)validSuits;
+ (NSArray *)rankStrings;
+ (NSUInteger)maxRank;

@end
