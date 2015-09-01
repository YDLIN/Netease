//
//  DuRightMenuMidCell.h
//  Netease
//
//  Created by Du on 15/7/31.
//  Copyright (c) 2015年 Du. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DuRightMenuMidCell : UIView
+ (instancetype)cellForView;
@property (strong, nonatomic) UIImage *image;
@property (copy, nonatomic) NSString *title;
@end
