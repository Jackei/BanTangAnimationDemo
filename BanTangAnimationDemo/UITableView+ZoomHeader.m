//
//  tableview.m
//  ZoomTableHeaderView
//
//  Created by qizhijian on 15/10/13.
//  Copyright © 2015年 qizhijian. All rights reserved.
//

#import "UITableView+ZoomHeader.h"
#import <objc/runtime.h>

static NSString *observerKeyPath = @"contentOffset";
static void *observerContext;
static char *zoomHeaderView;

#define topOffset (-200)
#define deltScale 0.5
#define maxPullDistance 300

@implementation UITableView(ZoomHeader)

- (void)addZoomHeader:(UIView *)objc
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, objc.frame.size.width, objc.frame.size.height)];

    [view addSubview:objc];
    
    self.tableHeaderView = view;
    [self sendSubviewToBack:view];
    
    objc_setAssociatedObject(self, zoomHeaderView, view, OBJC_ASSOCIATION_ASSIGN);
    
    [self addObserver:self forKeyPath:observerKeyPath options:NSKeyValueObservingOptionNew context:&observerContext];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (keyPath == observerKeyPath)
    {
        [self tableViewDidScroll];
    }
}

- (void)tableViewDidScroll
{
    CGFloat offset_y = self.contentOffset.y;

    UIView *view = objc_getAssociatedObject(self, zoomHeaderView);
    
    if (offset_y >= 0)
    {
        UIView *v = [view.subviews lastObject];

        for (UIView *v1 in v.subviews) {
            
            CGRect frame = v1.frame;
            frame.size.height = view.frame.size.height;
            frame.origin.y = 0;
            v1.frame = frame;
            
        }
    }
    else
    {
        CGFloat process = -(offset_y/maxPullDistance);
        
        if (process > 1)
        {
            process = 1;
        }
        
        CGFloat zoomScale = 1 + deltScale*process;
        
        UIView *v = [view.subviews lastObject];
        
        v.transform = CGAffineTransformMakeScale(zoomScale, zoomScale);
        
        for (UIView *v1 in v.subviews) {
            CGRect frame = v1.frame;
            frame.size.height = view.frame.size.height - offset_y;
            frame.origin.y = offset_y;
            frame.origin.x = offset_y/2;
            frame.size.width = view.frame.size.width - offset_y;
            v1.frame = frame;
        }
    }
}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:observerKeyPath];
}

@end
