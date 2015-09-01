//
//  DuRightMenuController.m
//  Netease
//
//  Created by Du on 15/7/31.
//  Copyright (c) 2015年 Du. All rights reserved.
//

#import "DuRightMenuController.h"
#import "DuRightMenuMidCell.h"
NSString *const cellAccount = @"3";
@interface DuRightMenuController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UIView *midView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@end

@implementation DuRightMenuController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化中间的view
    [self setupMidView];
    //初始化底部的view
    [self setupBottomView];
}
- (void)setupMidView{
    [self setupCellViewWithTitle:@"商城 能赚能花土豪当家" icon:[UIImage imageNamed:@"promoboard_icon_mall"]];
    [self setupCellViewWithTitle:@"活动 粉丝见面会招募" icon:[UIImage imageNamed:@"promoboard_icon_activities"]];
    [self setupCellViewWithTitle:@"应用 下载应用送金币" icon:[UIImage imageNamed:@"promoboard_icon_apps"]];
}
- (void)setupCellViewWithTitle:(NSString *)title icon:(UIImage *)icon{
    DuRightMenuMidCell *cellView = [DuRightMenuMidCell cellForView];
    cellView.y = cellView.height *self.midView.subviews.count;
    cellView.title = title;
    cellView.image = icon;
    [self.midView addSubview:cellView];
}
- (void)setupBottomView{
    
}
- (void)didShow{
    [UIView transitionWithView:self.iconView duration:0.8 options:UIViewAnimationOptionTransitionFlipFromTop animations:^{
        self.iconView.image = [UIImage imageNamed:@"user_defaultgift"];
    } completion:^(BOOL finished) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView transitionWithView:self.iconView duration:0.8 options:UIViewAnimationOptionTransitionFlipFromTop animations:^{
                self.iconView.image = [UIImage imageNamed:@"default_avatar"];
            } completion:nil];
        });
    }];
    
}

@end
