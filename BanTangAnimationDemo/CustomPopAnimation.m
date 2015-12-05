//
//  CustomPopAnimation.m
//  BanTangAnimationDemo
//
//  Created by 齐志坚 on 15/12/5.
//  Copyright © 2015年 齐志坚. All rights reserved.
//

#import "CustomPopAnimation.h"
#import "TextViewController.h"
#import "ViewController.h"

@implementation CustomPopAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 1.0f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    ViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    TextViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    [[transitionContext containerView] addSubview:toViewController.view];
    [[transitionContext containerView] bringSubviewToFront:fromViewController.view];
    
    toViewController.view.transform = CGAffineTransformMakeScale(0.95, 0.95);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        toViewController.view.transform = CGAffineTransformMakeScale(1, 1);
        fromViewController.view.transform = CGAffineTransformMakeTranslation(CGRectGetWidth(fromViewController.view.frame), 0);
        
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
    }];
}

@end
