//
//  BaseViewController.m
//  WeiboMovieDemo
//
//  Created by 齐志坚 on 15/11/28.
//  Copyright © 2015年 齐志坚. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.baseNavigationView = [[BaseNavigationView alloc] initWithFrame:CGRectMake(0, 0, [BaseNavigationView barWidth], [BaseNavigationView barHeight])];
    self.baseNavigationView.VC = self;
    [self.view addSubview:self.baseNavigationView];
    [self.view bringSubviewToFront:self.baseNavigationView];
}

@end
