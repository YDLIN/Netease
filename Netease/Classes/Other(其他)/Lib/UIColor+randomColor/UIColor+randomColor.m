//
//  UIColor+randomColor.m
//  UIDynamic
//
//  Created by Du on 15/7/26.
//  Copyright (c) 2015年 Du. All rights reserved.
//

#import "UIColor+randomColor.h"

@implementation UIColor (randomColor)
+ (UIColor *)colorWithRandomColor{
    CGFloat r = arc4random_uniform(256)/255.0;
    CGFloat g = arc4random_uniform(256)/255.0;
    CGFloat b = arc4random_uniform(256)/255.0;
    UIColor *random = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
    return random;
}

+ (UIColor *)colorWithRandomColorAndAlpha:(CGFloat)alpha
{
    CGFloat r = arc4random_uniform(256)/255.0;
    CGFloat g = arc4random_uniform(256)/255.0;
    CGFloat b = arc4random_uniform(256)/255.0;
    UIColor *random = [UIColor colorWithRed:r green:g blue:b alpha:alpha];
    return random;
}
+ (UIColor *)colorwithR:(CGFloat)Red G:(CGFloat)Green B:(CGFloat)Blue A:(CGFloat)Alpha{
    return [UIColor colorWithRed:Red/255.0 green:Green/255.0 blue:Blue/255.0 alpha:Alpha/1.0];
}


@end
