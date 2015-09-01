//
//  DuMenuView.m
//  Netease
//
//  Created by Du on 15/7/27.
//  Copyright (c) 2015年 Du. All rights reserved.
//

#import "DuMenuView.h"

static NSString *const edge = @"20";
@interface DuMenuView ()
@property (strong, nonatomic) UIButton *selectedBtn;

@end

@implementation DuMenuView

- (instancetype)initWithFrame:(CGRect)frame
{
    CGFloat alpha = 0.2;

    if (self = [super initWithFrame:frame]) {

      [self setupButtonWithImage:[UIImage imageNamed:@"sidebar_nav_news"] title:@"新闻" color:DuRGBAColor(202, 68, 73, alpha)];
        [self setupButtonWithImage:[UIImage imageNamed:@"sidebar_nav_reading"] title:@"订阅" color:DuRGBAColor(190, 111, 69, alpha)];
        [self setupButtonWithImage:[UIImage imageNamed:@"sidebar_nav_photo"] title:@"图片" color:DuRGBAColor(76, 132, 190, alpha)];
        [self setupButtonWithImage:[UIImage imageNamed:@"sidebar_nav_video"] title:@"视频" color:DuRGBAColor(101, 170, 78, alpha)];
        [self setupButtonWithImage:[UIImage imageNamed:@"sidebar_nav_comment"] title:@"跟帖" color:DuRGBAColor(170, 172, 73, alpha)];
        [self setupButtonWithImage:[UIImage imageNamed:@"sidebar_nav_radio"] title:@"电台" color:DuRGBAColor(190, 62, 119, alpha)];
    }
    return self;
}

- (void)setDelegate:(id<DuMenuViewDelegate>)delegate{
    _delegate = delegate;
    [self btnTap:[self.subviews firstObject]];
}

- (UIButton *)setupButtonWithImage:(UIImage *)image title:(NSString *)title color:(UIColor *)color{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageWithColor:color] forState:UIControlStateSelected];
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, -[edge intValue], 0, 0);
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, [edge intValue], 0, 0);
    [btn addTarget:self action:@selector(btnTap:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    return btn;
    
}

- (void)btnTap:(UIButton *)button{
    if ([self.delegate respondsToSelector:@selector(menuViewDidSelectedFrom:to:)]) {
        [self.delegate menuViewDidSelectedFrom:self.selectedBtn.tag to:button.tag];
    }
    self.selectedBtn.selected = NO;
    button.selected = YES;
    self.selectedBtn = button;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    NSInteger btnCount = self.subviews.count;
    CGFloat btnW = self.bounds.size.width;
    CGFloat btnH = self.bounds.size.height/btnCount;
    
    for (int i = 0; i < btnCount; i++) {
        UIButton *btn = self.subviews[i];
        btn.tag = i;
        CGFloat btnX = 0;
        CGFloat btnY = i * btnH;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
}



@end
