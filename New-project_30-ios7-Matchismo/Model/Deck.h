//
//  Deck.h
//  New-Project_29-ios7-PlayingCard
//
//  Created by Geraint on 2018/6/16.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

// Deck类，表示【牌堆】
@interface Deck : NSObject

// 将纸牌加到牌堆里
- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

// 随机从牌堆里抽取一张牌
- (Card *)drawRandomCard;

@end
