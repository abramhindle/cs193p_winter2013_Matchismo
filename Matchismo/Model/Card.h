//
//  Card.h
//  Matchismo
//
//  Created by Rob Freiburger on 2/4/13.
//  Copyright (c) 2013 Rob Freiburger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

// Public instance methods
@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter = isFaceUp) BOOL faceUp;
@property (nonatomic, getter = isUnplayable) BOOL unplayable;

// Public methods
- (int)match:(NSArray *)otherCards;

@end