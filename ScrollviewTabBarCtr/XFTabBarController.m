//
//  XFTabBarController.m
//  ScrollviewTabBarCtr
//
//  Created by biznest on 15/7/7.
//  Copyright (c) 2015年 biznest. All rights reserved.
//

#import "XFTabBarController.h"

#define XF_UI_WIDTH   [UIScreen mainScreen].bounds.size.width
#define XF_UI_HEIGHT  [UIScreen mainScreen].bounds.size.height

@interface XFTabBarController ()
{
    UIScrollView *_scrollview;
}
@end

@implementation XFTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initTabBar];
}

- (void)initTabBar
{
    _scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, XF_UI_HEIGHT-49, XF_UI_WIDTH, 49)];
    _scrollview.contentSize = CGSizeMake(XF_UI_WIDTH/4 * _viewControllers.count, 49);
    _scrollview.showsHorizontalScrollIndicator = NO;
    _scrollview.showsVerticalScrollIndicator = NO;
    
    for (int i = 0; i < _viewControllers.count; i ++) {
        UIButton *tabBarItem = [UIButton buttonWithType:UIButtonTypeCustom];
        tabBarItem.frame = CGRectMake(XF_UI_WIDTH/4 * i, 0, XF_UI_WIDTH/4, 49);
        UIViewController *ctr = _viewControllers[i];
        [tabBarItem setImage:ctr.tabBarItem.image forState:UIControlStateNormal];
        [tabBarItem setImage:ctr.tabBarItem.selectedImage forState:UIControlStateSelected];
        [tabBarItem setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [tabBarItem setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [tabBarItem setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
        [tabBarItem setTitleEdgeInsets:UIEdgeInsetsMake(49-15, -tabBarItem.imageView.image.size.width, 3, 0)];
        [tabBarItem setImageEdgeInsets:UIEdgeInsetsMake(5, tabBarItem.titleLabel.frame.size.width, 18, 0)];
        
        tabBarItem.tag = 100 + i;
        [tabBarItem addTarget:self action:@selector(tabBarItemClick:) forControlEvents:UIControlEventTouchUpInside];
        
        //外观
        _scrollview.backgroundColor = [UIColor colorWithRed:248/255.0 green:249/255.0 blue:248/255.0 alpha:1.0];
        _scrollview.layer.cornerRadius = 2.0f;
        _scrollview.layer.borderWidth = 1.0f;
        _scrollview.layer.borderColor = [UIColor lightGrayColor].CGColor;
        [_scrollview addSubview:tabBarItem];
        
        //开始选择按钮
        if (i == 0) {
            [self tabBarItemClick:tabBarItem];
        }
    }
    [self.view addSubview:_scrollview];
}

- (void)tabBarItemClick:(UIButton *)sender
{
    for (int i = 0; i < _viewControllers.count; i ++) {
        UIButton *bt = (UIButton *)[_scrollview viewWithTag:100 + i];
        bt.selected = NO;
    }
    sender.selected = YES;
    UIViewController *v = _viewControllers[sender.tag - 100];
    v.view.frame = CGRectMake(0, 0, XF_UI_WIDTH, XF_UI_HEIGHT- 49);
    [self.view addSubview:v.view];
}

@end
