//
//  ViewController.m
//  New-project_30-ios7-Matchismo
//
//  Created by Geraint on 2018/6/19.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

// 返回类型IBAction，这实际上是typedef void ，这个方法实际返回void，在这里主要是：分辨哪个方法是目标动作
// 参数是sender这个按钮，即每次按钮被触摸时，它都会发送这一消息，事件就是触摸按钮
// 按钮事件：即 点击按钮后会发生什么
- (IBAction)touchCardButton:(UIButton *)sender {
    
    
    // 让它可以：两面翻动
    // 用于检验长度不为0：（按钮标题不为nil时，翻页）
    if ([sender.currentTitle length]) {
        
        // 设置点击按钮后的会变成的图片
        UIImage *cardImage = [UIImage imageNamed:@"cardDeck"];
        // 设置这个按钮的背景图像，sender也就是发送这一消息的按钮
        [sender setBackgroundImage:cardImage
                          forState:UIControlStateNormal]; // forState:默认或正常或高亮状态
        // 设置翻页后的标题
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else { // 如果按钮上面没有标题，就翻回正面
        // 设置点击按钮后的会变成的图片
        UIImage *cardImage = [UIImage imageNamed:@"cardfront"];
        // 设置这个按钮的背景图像，sender也就是发送这一消息的按钮
        [sender setBackgroundImage:cardImage
                          forState:UIControlStateNormal]; // forState:默认或正常或高亮状态
        // 设置翻页后的标题
        [sender setTitle:@"A♣♠" forState:UIControlStateNormal];
        
    }
    
    
}



@end
