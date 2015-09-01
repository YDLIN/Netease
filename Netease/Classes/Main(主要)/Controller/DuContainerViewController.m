//
//  DuContainerViewController.m
//  Netease
//
//  Created by Du on 15/7/27.
//  Copyright (c) 2015年 Du. All rights reserved.
//

#import "DuContainerViewController.h"
#import "DuNewsViewController.h"
#import "DuMenuView.h"
#import "DuNavigationController.h"
#import "DuTitleButton.h"
#import "DuReadViewController.h"
#import "DuPictureViewController.h"
#import "DuRadioViewController.h"
#import "DuVedioViewController.h"
#import "DuCommentViewController.h"
#import "DuRightMenuController.h"

#define MaxY 100

typedef NS_ENUM(NSUInteger, state) {
    KStateMain,
    KStateMenu
};
@interface DuContainerViewController ()<DuMenuViewDelegate>
@property (weak, nonatomic) DuNavigationController *nav;
@property (weak, nonatomic) UIButton *cover;
@property (assign, nonatomic) CGFloat scale;
@property (weak, nonatomic) DuNavigationController *curNav;
@property (weak, nonatomic) DuMenuView *menu;
@property (assign, nonatomic) CGFloat panStartX;
@property (assign, nonatomic) CGFloat leftDistance;
@property (assign, nonatomic) state sta;
@property (assign, nonatomic) CGFloat distance;
@property (strong, nonatomic) DuRightMenuController *rightMenu;

@end

@implementation DuContainerViewController
- (DuRightMenuController *)rightMenu{
    if (!_rightMenu) {
        _rightMenu = [[DuRightMenuController alloc] init];
    }
    return _rightMenu;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupAllChildViewController];
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
//    [self.curNav.view addGestureRecognizer:pan];
    //导航控制器缩放后左侧的值
    self.leftDistance = DuScreenBounds.size.width *0.75;
    self.sta = KStateMain;
    self.distance = 0;
}
- (void)handlePan:(UIPanGestureRecognizer *)recognizer{
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        self.panStartX = [recognizer locationInView:self.view].x;
    }
    if (self.panStartX >= 75 && self.sta == KStateMain) {
        return;
    }
    CGFloat offsetX = [recognizer translationInView:self.view].x;
    if (offsetX < 0 && self.sta == KStateMain) {
        return;
    }
    CGFloat dis = self.distance + offsetX;
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        if (dis >= DuScreenBounds.size.width * 0.4) {
            [self showMenu];//展示侧边栏
        } else {
            [self showHome];//展示主界面
        }
        return;
    }
    CGFloat curY = dis * 150/375;
    CGFloat curH = DuScreenBounds.size.height - 2 *curY;
    CGFloat scale = curH / DuScreenBounds.size.height;
    _scale = scale;
    self.curNav.view.center = CGPointMake(self.view.center.x + dis, self.view.center.y);
    self.curNav.view.transform = CGAffineTransformScale(CGAffineTransformIdentity,scale, scale);
    
}
- (CGAffineTransform)scaleOfView{
    CGFloat navH = DuScreenBounds.size.height - 2* 80;
    CGFloat scale = navH / DuScreenBounds.size.height;
    CGFloat leftMargin = scale *DuScreenBounds.size.width;
    CGFloat topMargin = (DuScreenBounds.size.height - navH) *0.5 /DuScreenBounds.size.height;
    CGAffineTransform scaleForm = CGAffineTransformMakeScale(scale, scale);
    CGAffineTransform translateForm = CGAffineTransformTranslate(scaleForm, leftMargin, topMargin);
    return translateForm;
}
- (UIButton *)coverOfView{
    UIButton *cover = [[UIButton alloc] initWithFrame:self.curNav.view.bounds];
    [cover addTarget:self action:@selector(coverTap) forControlEvents:UIControlEventTouchUpInside];
    cover.backgroundColor = [UIColor blackColor];
    cover.alpha = 0.02;
    self.cover = cover;
    return cover;
}
- (void)setupAllChildViewController
{
    DuNewsViewController *newVc = [[DuNewsViewController alloc] init];
    [self setupViewController:newVc withNavigationItemTitle:@"新闻"];

    DuReadViewController *readVc = [[DuReadViewController alloc] init];
    [self setupViewController:readVc withNavigationItemTitle:@"订阅"];

    DuPictureViewController *pictureVc = [[DuPictureViewController alloc] init];
    [self setupViewController:pictureVc withNavigationItemTitle:@"图片"];

    DuVedioViewController *vedioVc = [[DuVedioViewController alloc] init];
    [self setupViewController:vedioVc withNavigationItemTitle:@"视频"];

    DuCommentViewController *commentVc = [[DuCommentViewController alloc] init];
    [self setupViewController:commentVc withNavigationItemTitle:@"跟帖"];

    DuRadioViewController *radioVc = [[DuRadioViewController alloc] init];
    [self setupViewController:radioVc withNavigationItemTitle:@"电台"];

    UIImageView *bgImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sidebar_bg"]];
    bgImage.frame = self.view.bounds;
    [self.view insertSubview:bgImage atIndex:0];

    DuMenuView *menu = [[DuMenuView alloc] init];
    menu.delegate = self;
    menu.frame = CGRectMake(0, DuScreenBounds.size.height *0.15, DuScreenBounds.size.width *0.6, DuScreenBounds.size.height *0.7);

    menu.transform = CGAffineTransformMakeScale(0.6, 0.6);
    self.menu = menu;
    [self.view insertSubview:menu atIndex:1];
}


- (void)setupViewController:(UIViewController *)viewController withNavigationItemTitle:(NSString *)title{

    DuNavigationController *nav = [[DuNavigationController alloc] initWithRootViewController:viewController];

    viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem setupItemWithImage:[UIImage imageNamed:@"top_navigation_menuicon"] target:self action:@selector(leftButtonTap) tag:2];
    viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem setupItemWithImage:[UIImage imageNamed:@"top_navigation_infoicon"] target:self action:@selector(rightBarButtonTap) tag:1];

    DuTitleButton *titleBtn = [DuTitleButton setupTitleButtonWithTitle:title];
    viewController.navigationItem.titleView = titleBtn;

    [self addChildViewController:nav];

}


- (void)leftButtonTap{

    _menu.hidden = NO;
    _rightMenu.view.x = 2 *DuScreenBounds.size.width;
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.9 initialSpringVelocity:0.3 options:UIViewAnimationOptionCurveLinear animations:^{
        self.curNav.view.transform = [self scaleOfView];
        self.menu.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [self.curNav.view addSubview:[self coverOfView]];
    }];
}
#pragma mark - 代理方法
- (void)menuViewDidSelectedFrom:(NSInteger)fromIndex to:(NSInteger)toIndex
{
    DuNavigationController *oldNav = self.childViewControllers[fromIndex];
    [oldNav.view removeFromSuperview];
    
    DuNavigationController *newNav = self.childViewControllers[toIndex];
    newNav.view.transform = oldNav.view.transform;
    self.curNav = newNav;
    [self coverTap];
    [self.view addSubview:newNav.view];
}

//点击遮盖
- (void)coverTap{
    [self.cover removeFromSuperview];
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.9 initialSpringVelocity:0.3 options:UIViewAnimationOptionCurveLinear animations:^{
        self.curNav.view.transform = CGAffineTransformIdentity;
        self.menu.transform = CGAffineTransformMakeScale(0.6, 0.6);
    } completion:^(BOOL finished) {
        return ;
    }];
}
- (void)rightBarButtonTap{
    _menu.hidden = YES;
    _rightMenu.view.hidden = NO;
    CGFloat navH = DuScreenBounds.size.height - 2* 80;
    CGFloat scale = navH / DuScreenBounds.size.height;
    CGFloat leftMargin = scale *DuScreenBounds.size.width;

    CGFloat topMargin = (DuScreenBounds.size.height - navH) *0.5 /DuScreenBounds.size.height;

    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.9 initialSpringVelocity:0.3 options:UIViewAnimationOptionCurveLinear animations:^{
        CGAffineTransform scaleForm = CGAffineTransformMakeScale(scale, scale);
        CGAffineTransform translateForm = CGAffineTransformTranslate(scaleForm, -leftMargin - 50, topMargin);
        self.curNav.view.transform = translateForm;
    } completion:^(BOOL finished) {
        [self.curNav.view addSubview:[self coverOfView]];
        [self.rightMenu didShow];
    }];
    self.rightMenu.view.frame = CGRectMake(DuScreenBounds.size.width - leftMargin, 0, leftMargin, DuScreenBounds.size.height);
    [self.view insertSubview:self.rightMenu.view atIndex:1];
    
}
- (void)showMenu{
    NSLog(@"%s",__func__);
}
- (void)showHome{
    NSLog(@"%s",__func__);
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
@end
