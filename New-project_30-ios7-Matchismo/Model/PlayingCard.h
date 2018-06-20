//
//  PlayingCard.h
//  New-Project_29-ios7-PlayingCard
//
//  Created by Geraint on 2018/6/18.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "Card.h"


// playingCard 是 Card的子类，它专指扑克牌内容，比如红桃Q、梅花A。。。
@interface PlayingCard : Card

@property (strong,nonatomic) NSString *suit; // suit 是指花色，例如：方片、梅花、红心。。。
@property (nonatomic) NSUInteger rank;       // rank 就是大小，例如：1、3、5、J、Q、A、

+ (NSArray *)validSuits;

+ (NSUInteger)maxRank;
@end
