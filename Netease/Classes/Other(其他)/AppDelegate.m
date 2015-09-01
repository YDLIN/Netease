//
//  AppDelegate.m
//  Netease
//
//  Created by Du on 15/7/27.
//  Copyright (c) 2015年 Du. All rights reserved.
//

#import "AppDelegate.h"
//#import "DuNavigationController.h"
#import "DuContainerViewController.h"
#import "DuAdViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:DuScreenBounds];
    //容器控制器
    DuContainerViewController *containerView = [[DuContainerViewController alloc] init];
    //广告控制器
    DuAdViewController *adViewController = [[DuAdViewController alloc] init];
    //背景图片
    UIImageView *backgroundImageView = [[UIImageView alloc] init];
    backgroundImageView.image = [UIImage imageNamed:@"Default"];
    backgroundImageView.frame = DuScreenBounds;
    //广告图片
    UIImageView *imageIView = [[UIImageView alloc] init];
    imageIView.image = [UIImage imageNamed:@"Lottery"];
    imageIView.frame = CGRectMake(0, 0, DuScreenBounds.size.width, DuScreenBounds.size.height *0.8);
    [backgroundImageView addSubview:imageIView];
    [adViewController.view addSubview:backgroundImageView];
    self.window.rootViewController = adViewController;
    //四秒后消除广告
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.window.rootViewController = containerView;
    });
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
