//
//  UIView+Frame.h
//  彩票
//
//  Created by Du on 15/7/21.
//  Copyright (c) 2015年 Du. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)
// @property在分类里面只会自动生成get,set方法，并不会生成下划线的成员属性
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@end
