//
//  Card.h
//  New-project_30-ios7-Matchismo
//
//  Created by Geraint on 2018/6/20.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

// NSString 和 @property 这会声明每一个纸牌实例都需要一个空间（都在堆内存中）
// strong :强   week：弱
// 在堆内存中，只要有一个strong（强）指针存在，它就会把其留在堆中。只有不在有强指针是，才会立即释放内存
// nonatomic:非原子性，非原子是指同该属性一同的setter和getter不是线程安全的。不能同时有两个线程，同时尝试设置该属性
@property (strong,nonatomic) NSString *contents; // 表示纸牌的内容，纸牌上印有什么花色：（方片A、梅花Q、红桃K、黑桃6）
// 这两个类型不需要强或弱来修饰，因为它们是BOOL类型，也就是原始类型，它们没有储存在堆里。
// 这里只有整型或浮点型，它们没有内存管理需求,所以这里不涉及指针，只有BOOL
@property (nonatomic,getter=isChosen) BOOL chosen;   // 选择,强调是否“是”被选择，所以我们可以用getter重命名，用isChosen，getter = 你想要的名字
@property (nonatomic,getter=isMatchod) BOOL matched; // 匹配，强调是否“是”匹配，getter重命名，用isMatchod


// 两张纸牌是否匹配，
// 它将另一张纸牌作为参数，返回一个整数，如果纸牌不匹配，它就返回0；否则，他就返回匹配越好，整数值就越大。
//- (int)match:(Card *)card;

// （方法同上，只是参数改变）这里让match的参数是一个纸牌的数组
// 我们让这张牌与其他很多牌相互匹配
- (int)match:(NSArray *)otherCards;

@end
