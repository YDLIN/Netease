//
//  DuTitleButton.m
//  Netease
//
//  Created by Du on 15/7/29.
//  Copyright (c) 2015年 Du. All rights reserved.
//

#import "DuTitleButton.h"

@implementation DuTitleButton
+ (DuTitleButton *)setupTitleButtonWithTitle:(NSString *)title{
    DuTitleButton *titleBtn = [DuTitleButton buttonWithType:UIButtonTypeCustom];
    titleBtn.userInteractionEnabled = NO;
    [titleBtn setImage:[UIImage imageNamed:@"navbar_netease"] forState:UIControlStateNormal];
    [titleBtn setTitle:title forState:UIControlStateNormal];
    [titleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    titleBtn.titleLabel.font = [UIFont boldSystemFontOfSize:22];
    titleBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);

    titleBtn.height = titleBtn.currentImage.size.height;
    NSDictionary *dict = @{NSFontAttributeName : titleBtn.titleLabel.font};
    CGFloat titleW = [title boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size.width;
    titleBtn.width = titleW + titleBtn.currentImage.size.width + titleBtn.titleEdgeInsets.left;
    return titleBtn;
}
@end
