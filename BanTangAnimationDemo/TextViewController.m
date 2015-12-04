//
//  TextViewController.m
//  BanTangAnimationDemo
//
//  Created by 齐志坚 on 15/12/4.
//  Copyright © 2015年 齐志坚. All rights reserved.
//

#import "TextViewController.h"
#import "CustomCell.h"
#import "UITableView+ZoomHeader.h"

static NSString * const cellIdentifier = @"cellIdentifier";

@interface TextViewController () <UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation TextViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.baseNavigationView.alpha = 0;
    
    [self performSelector:@selector(reloadData) withObject:nil afterDelay:1];
}

- (void)reloadData
{
    [self.tableView reloadData];
    [self.view bringSubviewToFront:self.baseNavigationView];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) return 1;
    return 20;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 1)
    {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
        view.backgroundColor = [UIColor orangeColor];
        return view;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) return 0;
    return 44;
}

- (UITableView *)tableView
{
    if (_tableView == nil)
    {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        [_tableView registerClass:[CustomCell class] forCellReuseIdentifier:cellIdentifier];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, _imageView.frame.size.height)];
        [view addSubview:_imageView];
        [_tableView addZoomHeader:view];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y > 0)
    {
        self.tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    }
    else
    {
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    self.baseNavigationView.alpha = scrollView.contentOffset.y/_imageView.frame.size.height;
}
@end
