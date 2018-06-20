//
//  PlayingCard.m
//  New-Project_29-ios7-PlayingCard
//
//  Created by Geraint on 2018/6/18.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

// 重写getter方法，contents ,基于其他两个属性来实际计算contents的值：
- (NSString *)contents {
    
    // 返回 contents属性的值，即返回扑克牌的内容：计算自花色和大小的字符串
   // return [NSString stringWithFormat:@"%lu%@", self.rank, self.suit];
    
    NSArray *rankStrings = [PlayingCard rankStrigns]; // 调用方法：[类名 方法名]
    return [rankStrings[self.rank] stringByAppendingString:self.suit]; // 扑克牌的花色和大小合并
    
}

@synthesize suit = _suit; // 合并，属性suit将储存于实例变量_suit中。

// “+”，类方法，意味着将它发送给类，而不是实例对象，所以不能用任何实例变量
// *** *** “+”类方法，有两种情况需要创建：1、创建事物 。2、工具方法：例如返回常数。
// 我们将花色组成的数组放在另一个数组
+ (NSArray *)validSuits {
    return @[@"♣",@"♦",@"♥",@"♠"];
}

// containsObject会将suit和这个数组中法四个花色一一对比
- (void)setSuit:(NSString *)suit {
    // 调用方法：[类名 方法名]
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

// 重写suitgetter方法：如果suit为nil，就返回“？”，不为空，则返回实际值。
- (NSString *)suit {
    return _suit ? _suit:@"?";
}

// 不准备将这个方法作为 “公共的”,所以不用在.h文件里写出来，将下面的方法作为公共的
// 我们把上面的字符串大小放进这个 类方法中
+ (NSArray *)rankStrigns {
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

// 公共的方法，牌的数量
+ (NSUInteger)maxRank {
    return [[PlayingCard rankStrigns] count] -1;
}
// 限制扑克牌的大小
- (void)setRank:(NSUInteger)rank {
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

@end
