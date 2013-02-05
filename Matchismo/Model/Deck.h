//
//  Deck.h
//  Matchismo
//
//  Created by Rob Freiburger on 2/4/13.
//  Copyright (c) 2013 Rob Freiburger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;

- (Card *)drawRandomCard;

@end
