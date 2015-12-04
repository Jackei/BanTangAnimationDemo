//
//  CustomAnimator.m
//  BanTangAnimationDemo
//
//  Created by 齐志坚 on 15/12/4.
//  Copyright © 2015年 齐志坚. All rights reserved.
//

#import "CustomAnimator.h"
#import "TextViewController.h"
#import "ViewController.h"

@implementation CustomAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 1.0f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    TextViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    ViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    [[transitionContext containerView] addSubview:toViewController.view];
        
    UIImage *image = fromViewController.imageView.image;
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = image;
    imageView.frame = CGRectMake(CGRectGetMinX(fromViewController.imageView.frame), CGRectGetMinY(fromViewController.imageView.frame), CGRectGetWidth(fromViewController.imageView.frame), CGRectGetHeight(fromViewController.imageView.frame));
    [toViewController.view addSubview:imageView];
    toViewController.imageView = imageView;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        imageView.frame = CGRectMake(0, 0, CGRectGetWidth(fromViewController.imageView.frame), CGRectGetHeight(fromViewController.imageView.frame));

    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
    }];
}

@end
