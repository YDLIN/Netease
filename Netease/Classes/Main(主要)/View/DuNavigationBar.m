//
//  DuNavigationBar.m
//  Netease
//
//  Created by Du on 15/7/30.
//  Copyright (c) 2015年 Du. All rights reserved.
//

#import "DuNavigationBar.h"

@implementation DuNavigationBar

- (void)layoutSubviews{
    [super layoutSubviews];
    for (UIButton *button in self.subviews) {
        if ([button isKindOfClass:[UIButton class]]){
            if (button.tag == 2) {//左边按钮
                button.x = 0;
            }else if (button.tag == 1){//右边按钮
                button.x = DuScreenBounds.size.width - button.width;
            }
        }
    }
}

@end
