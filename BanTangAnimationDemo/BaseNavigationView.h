//
//  BaseNavigationView.h
//  WeiboMovieDemo
//
//  Created by 齐志坚 on 15/11/28.
//  Copyright © 2015年 齐志坚. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseNavigationView : UIView
{
    @private
    UIView *_bottomView;
}

@property (nonatomic,weak)   UIViewController *VC;

@property (nonatomic,strong) UIImageView *bgImageView;
@property (nonatomic,strong) UILabel     *titleLabel;
@property (nonatomic,strong) UIButton    *leftButton;
@property (nonatomic,strong) UIButton    *rightButton;
@property (nonatomic,strong) UIButton    *backButton;

+ (CGFloat)barWidth;
+ (CGFloat)barHeight;

@end
