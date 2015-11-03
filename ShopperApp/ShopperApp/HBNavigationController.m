//
//  HBNavigationController.m
//  ShopperApp
//
//  Created by 李超 on 15/10/27.
//  Copyright © 2015年 清大世纪好班项目组. All rights reserved.
//

#import "HBNavigationController.h"

@interface HBNavigationController ()

@end

@implementation HBNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
      self.navigationBar.translucent = YES;
    self.navigationBar.opaque =YES;
    self.navigationBar.barStyle =UIBarStyleBlackOpaque;
  
    self.navigationBar.barTintColor =RGBA(52,152,217,1);
    
 
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
