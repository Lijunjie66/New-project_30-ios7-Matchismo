//
//  Card.m
//  New-project_30-ios7-Matchismo
//
//  Created by Geraint on 2018/6/20.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "Card.h"

@implementation Card

// 数组内部的纸牌和想要比较的纸牌作比较的方法：
- (int)match:(NSArray *)otherCards {
    int score = 0;
    
    // 便利所有纸牌
    for(Card *card in otherCards) {
        if([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    
    return score;
}


@end
