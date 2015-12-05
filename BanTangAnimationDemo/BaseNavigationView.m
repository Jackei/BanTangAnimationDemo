//
//  BaseNavigationView.m
//  WeiboMovieDemo
//
//  Created by 齐志坚 on 15/11/28.
//  Copyright © 2015年 齐志坚. All rights reserved.
//

#import "BaseNavigationView.h"
#import "Config.h"

#define BaseNavViewHeight 64.0f

@implementation BaseNavigationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self creatUI];
    }
    return self;
}

- (void)creatUI
{
    self.backgroundColor = RGB_COLOR(@"#232323");
    
    _bgImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    _bgImageView.backgroundColor = [UIColor redColor];
    [self addSubview:_bgImageView];
    
    _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, _bgImageView.bounds.size.height - 0.5f, [[self class] barSize].width, 0.5f)];
    _bottomView.backgroundColor = RGB_COLOR(@"#232323");
    _bottomView.alpha = 0.6f;
    [_bgImageView addSubview:_bottomView];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.font = [UIFont systemFontOfSize:20.0f];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.frame = CGRectMake([[self class]  barBtnSize].width + 5.0f, 22.0f, [[self class] barSize].width - 2 * [[self class] barBtnSize].width - 10.0f, 40.0f);

    self.backButton = [[self class] createNavButtonByImageNormal:@"icon_back" imageSelected:@"icon_back" target:self action:@selector(backButtonClicked:)];
    [self.backButton setImageEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
    [self setLeftNavButton:self.backButton];
}

- (void)backButtonClicked:(id)sender
{
    if (self.VC)
    {
        if (self.VC.presentedViewController)
        {
            [self.VC dismissViewControllerAnimated:YES completion:nil];
        }
        else
        {
            [self.VC.navigationController popViewControllerAnimated:YES];
        }
    }
}

- (void)setLeftNavButton:(UIButton *)button
{
    if (_leftButton)
    {
        [_leftButton removeFromSuperview];
        _leftButton = nil;
    }
    _leftButton = button;
    if (_leftButton) {
        _leftButton.frame = CGRectMake(2.0f, 22.0f, [[self class] barBtnSize].width, [[self class] barBtnSize].height);
        [self addSubview:_leftButton];
    }
}

+ (UIButton *)createNavButtonByImageNormal:(NSString *)strNormal imageSelected:(NSString *)strSelected target:(id)target action:(SEL)action
{
    UIImage *imageNormal = [UIImage imageNamed:strNormal];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setImage:imageNormal forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:(strSelected ? strSelected : strNormal)] forState:UIControlStateSelected];
    
    CGFloat leftInset = ([[self class] barBtnSize].width - imageNormal.size.width) / 2.0f;
    CGFloat topInset = ([[self class] barBtnSize].height - imageNormal.size.height) / 2.0f;
    leftInset = (leftInset >= 2.0f) ? leftInset / 2.0f : 0.0f;
    topInset = (topInset >= 2.0f) ? topInset / 2.0f : 0.0f;
    [button setImageEdgeInsets:UIEdgeInsetsMake(topInset, leftInset, topInset, leftInset)];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(topInset, -imageNormal.size.width, topInset, leftInset)];
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, +30, 0, 0)];
    return button;
}

+ (CGFloat)barHeight
{
    return BaseNavViewHeight;
}

+ (CGFloat)barWidth
{
    return SCREEN_WIDTH;
}

+ (CGSize)barBtnSize
{
    return CGSizeMake(60.0f, 40.0f);
}

+ (CGSize)barSize
{
    return CGSizeMake(SCREEN_WIDTH, 64.0f);
}

@end
