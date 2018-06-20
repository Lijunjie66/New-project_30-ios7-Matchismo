//
//  ViewController.m
//  New-project_30-ios7-Matchismo
//
//  Created by Geraint on 2018/6/19.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "ViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"

@interface ViewController ()

// 翻拍标签
// weak，该标签有视图本身很强的保持着，所以我们不需要用强指针指着它，来保证它在堆中，视图会做这个。但是，如果该标签离开视图，它就会被清除出堆。
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount; // 翻牌次数
@property (nonatomic, strong) Deck *deck; // 我们需要在整个牌堆中找一个翻牌，所以需要【牌堆,Deck类】，因为我们需要牌堆一直存在，所以要用strong（强）

@end

@implementation ViewController

// 显然，我们希望使用惰性实例化来实例化这一属性
- (Deck *)deck {
    
    // 我要看我的实例变量是否为nil
    if (!_deck)
    {
        _deck = [self createDeck]; // 调用下面(创建一个牌堆)的方法：（createDeck：）
    }
    return _deck;
}

// 将会创建一个牌堆,作用：代替梅花A：按钮中的A♣
- (Deck *)createDeck {
    return [[PlayingCardDeck alloc] init];
}


// 返回类型IBAction，这实际上是typedef void ，这个方法实际返回void，在这里主要是：分辨哪个方法是目标动作
// 参数是sender这个按钮，即每次按钮被触摸时，它都会发送这一消息，事件就是触摸按钮
// 按钮事件：即 点击按钮后会发生什么
- (IBAction)touchCardButton:(UIButton *)sender {
    
    // 让它可以：两面翻动
    // 用于检验长度不为0：（按钮标题不为nil时，翻页）
    if ([sender.currentTitle length]) { // 当牌堆中的牌用完时，这里就将不再翻动
        
        // 设置点击按钮后的会变成的图片
        UIImage *cardImage = [UIImage imageNamed:@"cardDeck"];
        // 设置这个按钮的背景图像，sender也就是发送这一消息的按钮
        [sender setBackgroundImage:cardImage
                          forState:UIControlStateNormal]; // forState:默认或正常或高亮状态
        // 设置翻页后的标题
        [sender setTitle:@"" forState:UIControlStateNormal];
        self.flipCount++;
        
    } else { // 如果按钮上面没有标题，就翻回正面
        
        
        Card *card = [self.deck drawRandomCard]; // 调用Deck类中的方法（随机从牌堆中抽取一张扑克牌），下一步，就是将下面的【翻页标题】中的“A♣♠”改为随机卡牌的内容,即“card.contents”
        
        
        
        // 当扑克牌翻到54张之后，就不会再翻了，（计数同时停止）
        if (card) { // 这表示翻牌 ()
            // 设置点击按钮后的会变成的图片
            UIImage *cardImage = [UIImage imageNamed:@"cardfront"];
            // 设置这个按钮的背景图像，sender也就是发送这一消息的按钮
            [sender setBackgroundImage:cardImage
                              forState:UIControlStateNormal]; // forState:默认或正常或高亮状态
            // 设置翻页后的标题,forState:(这是 亮度状态)
            // [sender setTitle:@"A♣♠" forState:UIControlStateNormal];
            [sender setTitle:card.contents forState:UIControlStateNormal];
            self.flipCount++;
            
        }
    }
    // self.flipCount++;   // 当放在这里是，点击按钮，会一直翻牌，不会停止(超过一副牌时，继续计数),
}

//   **** 我们将使用flipCount的setter方法来达到：翻页 计数的目的
- (void)setFlipCount:(int)flipCount {
    _flipCount = flipCount; // 让UI属性保持同步
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips：%d", self.flipCount];
    NSLog(@"flipCount = %d", self.flipCount);
}


@end
