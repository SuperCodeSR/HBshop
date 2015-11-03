//
//  HBTabBarController.m
//  ShopperApp
//
//  Created by 李超 on 15/10/27.
//  Copyright © 2015年 清大世纪好班项目组. All rights reserved.
//

#import "HBTabBarController.h"
#import "HBNavigationController.h"
#import "HBCourseViewController.h"
#import "HBAgentViewController.h"
#import "HBMassageViewController.h"
#import "HBUserViewController.h"

@interface HBTabBarController ()

@end

@implementation HBTabBarController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    HBCourseViewController *courseCtrl = [[HBCourseViewController alloc]init];
    [self addChildViewCtrl:courseCtrl imageName:@"banjiquan" title:@"课程"];
    
    HBAgentViewController *agentCtrl = [[HBAgentViewController alloc]init];
    [self addChildViewCtrl:agentCtrl imageName:@"tongxunlu" title:@"机构"];
    
    HBMassageViewController *massageCtrl = [[HBMassageViewController alloc]init];
    [self addChildViewCtrl:massageCtrl imageName:@"faxian" title:@"消息"];
   
    HBUserViewController *userCtrl = [[HBUserViewController alloc]init];
    [self addChildViewCtrl:userCtrl imageName:@"wo" title:@"我"];
    
}

   // 添加tabbar控制器
- (void)addChildViewCtrl:(UIViewController *)ctrl imageName:(NSString *)imageName title:(NSString *)title{
//    ctrl.navigationItem.title =title;
//    ctrl.tabBarItem.title = title;
    ctrl.title =title;
    ctrl.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -3);
    
    ctrl.tabBarItem.image = [[UIImage imageNamed:imageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    ctrl.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@-2",imageName]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
   HBNavigationController *navCtrl = [[HBNavigationController alloc]initWithRootViewController:ctrl];
    [navCtrl addChildViewController:ctrl];
    
    [self addChildViewController:navCtrl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
