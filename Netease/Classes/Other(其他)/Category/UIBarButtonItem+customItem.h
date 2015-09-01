//
//  UIBarButtonItem+customItem.h
//  网易新闻
//
//  Created by Du on 15/7/15.
//  Copyright (c) 2015年 Du. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (customItem)
+ (UIBarButtonItem *)setupItemWithImage:(UIImage *)image target:(id)target action:(SEL)action tag:(NSInteger)tag;
@end
