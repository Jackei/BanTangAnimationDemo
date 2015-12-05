//
//  ViewController.m
//  BanTangAnimationDemo
//
//  Created by 齐志坚 on 15/12/4.
//  Copyright © 2015年 齐志坚. All rights reserved.
//

#import "ViewController.h"
#import "CustomAnimator.h"

@interface ViewController () <UINavigationControllerDelegate>

@end

@implementation ViewController
{
    CustomAnimator *animator;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.delegate = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewDidClick)]];

    animator = [[CustomAnimator alloc] init];
}

- (void)imageViewDidClick
{
    [self performSegueWithIdentifier:@"dopush" sender:self];
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPush) {
        return animator;
    }
    return nil;
}

@end
