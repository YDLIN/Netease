//
//  DuNavigationController.m
//  Netease
//
//  Created by Du on 15/7/27.
//  Copyright (c) 2015年 Du. All rights reserved.
//

#import "DuNavigationController.h"
#import "DuNavigationBar.h"

@interface DuNavigationController ()

@end

@implementation DuNavigationController
+ (void)initialize{
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    [bar setBackgroundImage:[UIImage imageNamed:@"top_navigation_background"] forBarMetrics:UIBarMetricsDefault];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setValue:[[DuNavigationBar alloc] init] forKeyPath:@"navigationBar"];
   
}

@end
