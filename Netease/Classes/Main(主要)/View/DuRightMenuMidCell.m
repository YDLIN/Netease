//
//  DuRightMenuMidCell.m
//  Netease
//
//  Created by Du on 15/7/31.
//  Copyright (c) 2015年 Du. All rights reserved.
//

#import "DuRightMenuMidCell.h"
@interface DuRightMenuMidCell()
@property (weak, nonatomic) IBOutlet UIButton *cellButton;
@end
@implementation DuRightMenuMidCell
+ (instancetype)cellForView{
    return [[[NSBundle mainBundle] loadNibNamed:@"DuRightMenuMidCell" owner:nil options:nil] lastObject];
}
- (void)setTitle:(NSString *)title{
    _title = title;
    [self.cellButton setTitle:title forState:UIControlStateNormal];
}
- (void)setImage:(UIImage *)image{
    _image = image;
    [self.cellButton setImage:image forState:UIControlStateNormal];
}
@end
