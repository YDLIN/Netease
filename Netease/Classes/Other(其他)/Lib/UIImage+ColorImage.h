//
//  UIImage+ColorImage.h
//  Netease
//
//  Created by Du on 15/7/27.
//  Copyright (c) 2015年 Du. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ColorImage)
//根据颜色生成图片
+ (UIImage *)imageWithColor:(UIColor *)color;
@end
