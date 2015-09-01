//
//  UIColor+randomColor.h
//  UIDynamic
//
//  Created by Du on 15/7/26.
//  Copyright (c) 2015年 Du. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (randomColor)
//生成不透明的随机色
+ (UIColor *)colorWithRandomColor;
//生成有透明度的随机色
+ (UIColor *)colorWithRandomColorAndAlpha: (CGFloat)alpha;
//根据RGB和alpha生成颜色
+ (UIColor *)colorwithR:(CGFloat)Red G:(CGFloat)Green B:(CGFloat)Blue A:(CGFloat)Alpha;

@end
