//
//  UIImage+ColorImage.m
//  Netease
//
//  Created by Du on 15/7/27.
//  Copyright (c) 2015年 Du. All rights reserved.
//

#import "UIImage+ColorImage.h"

@implementation UIImage (ColorImage)
+ (UIImage *)imageWithColor:(UIColor *)color{
    CGFloat imageW = 100;
    CGFloat imageH = 100;
    //开启位图上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(imageW, imageH), NO, 0);
    //根据颜色,画一个矩形框
    [color set];
    UIRectFill(CGRectMake(0, 0, imageW, imageH));
    //根据颜色生成一张图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    return image;
}
@end
