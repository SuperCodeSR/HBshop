//
//  BaseViewController.m
//  ShopperApp
//
//  Created by root-mac on 15/10/30.
//  Copyright © 2015年 清大世纪好班项目组. All rights reserved.
//

#import "BaseViewController.h"


@interface BaseViewController ()

@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;

@end

@implementation BaseViewController


- (void)setLeftBackButton {
    
    UIImage *image = [UIImage imageNamed:@""];
    UIImage *highlightedImage = [UIImage imageNamed:@""];
    self.leftButton = [self createButtonWithImage:image highlightedImage:highlightedImage action:@selector(goBack)];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:self.leftButton];
    UIBarButtonItem *negativeSpacer = [self createNegativeSpacer];
    // 不直接写self，因为self可能会被嵌套在ConditionContainerViewController里面
    UIViewController *viewController = [self nearestNavigationChildViewController];
    [viewController.navigationItem setLeftBarButtonItems:@[negativeSpacer, leftItem]];
    
}

- (void)setLeftBarButtonWithImage:(UIImage *)image action:(SEL)selector {
    
    self.leftButton = [self createButtonWithImage:image highlightedImage:nil action:selector];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:self.leftButton];
    UIBarButtonItem *negativeSpacer = [self createNegativeSpacer];
    // 不直接写self，因为self可能会被嵌套在ConditionContainerViewController里面
    UIViewController *viewController = [self nearestNavigationChildViewController];
    [viewController.navigationItem setLeftBarButtonItems:@[negativeSpacer, leftItem]];
}

- (void)setRightBarButtonWithImage:(UIImage *)image action:(SEL)selector {
    self.rightButton = [self createButtonWithImage:image highlightedImage:nil action:selector];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightButton];
    UIBarButtonItem *negativeSpacer = [self createNegativeSpacer];;
    // 不直接写self，因为self可能会被嵌套在ConditionContainerViewController里面
    UIViewController *viewController = [self nearestNavigationChildViewController];
    [viewController.navigationItem setRightBarButtonItems:@[negativeSpacer, rightItem]];
}


- (UIButton *)createButtonWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage action:(SEL)selector {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 30, 30);
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentFill;
    button.contentVerticalAlignment = UIControlContentVerticalAlignmentFill;
    button.adjustsImageWhenHighlighted = NO;
    [button setImage:image forState:UIControlStateNormal];
    if (highlightedImage) {
        [button setImage:highlightedImage forState:UIControlStateHighlighted];
    }
    [button addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (UIBarButtonItem *)createNegativeSpacer {
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSpacer.width = -5;
    return negativeSpacer;
}

- (UIViewController *)nearestNavigationChildViewController {
    UIViewController *currentViewController = self;
    while (currentViewController.parentViewController) {
        if ([currentViewController.parentViewController isKindOfClass:[UINavigationController class]]) {
            return currentViewController;
        }
        currentViewController = currentViewController.parentViewController;
    }
    return nil;
}

@end
