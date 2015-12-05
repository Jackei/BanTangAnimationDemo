//
//  BaseNavigationController.m
//  WeiboMovieDemo
//
//  Created by 齐志坚 on 15/11/28.
//  Copyright © 2015年 齐志坚. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setNavigationBarHidden:NO];
    [self.navigationBar setHidden:YES];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count >= 1)
    {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end
