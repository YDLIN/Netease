//
//  UIBarButtonItem+customItem.m
//  网易新闻
//
//  Created by Du on 15/7/15.
//  Copyright (c) 2015年 Du. All rights reserved.
//

#import "UIBarButtonItem+customItem.h"
@implementation UIBarButtonItem (customItem)
+ (UIBarButtonItem *)setupItemWithImage:(UIImage *)image target:(id)target action:(SEL)action tag:(NSInteger)tag
{
    UIButton *btn = [[UIButton alloc] init];
    btn.tag = tag;
    [btn setImage:image forState:UIControlStateNormal];
    CGRect frame = btn.frame;
    frame.size = btn.currentImage.size;
    btn.frame = frame;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}
@end
