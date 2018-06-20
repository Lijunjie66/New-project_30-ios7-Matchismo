//
//  Deck.m
//  New-Project_29-ios7-PlayingCard
//
//  Created by Geraint on 2018/6/16.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "Deck.h"

@interface Deck()

// 该属性是强属性（strong），因为我们希望只要指着数组时，他就应该保存在【堆】中。
@property (strong,nonatomic) NSMutableArray *cards; // Deck类里边有一些牌，我们需要某种内部数据结构来存储这些牌，所以我们将需要用到一个可变数组。

@end


@implementation Deck

- (NSMutableArray *)cards {
    
    // 如果_cards为nil，那么我们就要在堆中分配空间，并赋值给实例变量。保证_cards不会为（nil）什么都没有，至少为空数组
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

// 将纸牌加到牌堆里，atTop默认为NO
- (void)addCard:(Card *)card atTop:(BOOL)atTop {
    if (atTop) {
        // 如果在顶部，那么就插入对象，下标为0，表示是在顶端
        // insertObject: atIndex: 该方法时NSMutableArray中的方法
        [self.cards insertObject:card atIndex:0];// 该方法是将对象插入到数组指定下标处
    } else {
        [self.cards addObject:card]; // 如果下标不为0，则添加到数组尾部
    }
    
    
}

//

- (void)addCard:(Card *)card {
    
    [self addCard:card atTop:NO]; // 调用上边的方法
}

// // 随机从牌堆里抽取一张牌
- (Card *)drawRandomCard {
    Card *randomCard = nil;
    
    // 如果，[self.cards count]表示数组里有卡牌
    if ([self.cards count]) {
        
        // ***     随机抽取卡牌方法：随机从self.cards中抽取一张卡牌，
        unsigned index = arc4random() % [self.cards count]; // "arc4random"随机获取一个整数，之后的“%”表示求余数，“[self.cards count]”卡牌中卡牌的数目
        randomCard = self.cards[index]; // 随机数index作为self.cards的下标，选取卡牌
        [self.cards removeObjectAtIndex:index]; //最后，还要从数组中删除这张卡牌，因为这张牌被抽出
    }
   
    
    return randomCard;
    
}

@end
