//
//  BaseViewController.h
//  ShopperApp
//
//  Created by root-mac on 15/10/30.
//  Copyright © 2015年 清大世纪好班项目组. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController


- (void)setLeftBackButton;

- (void)setLeftBarButtonWithImage:(UIImage *)image action:(SEL)selector;

- (void)setRightBarButtonWithImage:(UIImage *)image action:(SEL)selector;


@end
