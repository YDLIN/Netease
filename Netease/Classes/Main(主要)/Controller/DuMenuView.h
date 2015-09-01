//
//  DuMenuView.h
//  Netease
//
//  Created by Du on 15/7/27.
//  Copyright (c) 2015年 Du. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol DuMenuViewDelegate <NSObject>
@optional
- (void)menuViewDidSelectedFrom:(NSInteger)fromIndex to:(NSInteger)toIndex;
@end
@interface DuMenuView : UIView
@property (weak, nonatomic) id<DuMenuViewDelegate> delegate;
@end
