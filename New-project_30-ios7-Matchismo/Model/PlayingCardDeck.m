//
//  PlayingCardDeck.m
//  New-Project_29-ios7-PlayingCard
//
//  Created by Geraint on 2018/6/19.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

// playingCardDeck类没有公共API，所以它将重写一个间接继承自NSObject的方法
- (instancetype)init {
    if (self = [super init]) {
        // 便利所有花色，便利所有大小
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++) {
                // 创建一张牌，添加到我自身
                PlayingCard *card = [[PlayingCard alloc] init];
                card.suit = suit;
                card.rank = rank;
                [self addCard:card];
            }
        }
    }
    return self;
}

@end
