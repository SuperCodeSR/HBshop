//
//  HBUserHeaderBigView.m
//  ShopperApp
//
//  Created by 李超 on 15/11/1.
//  Copyright © 2015年 清大世纪好班项目组. All rights reserved.
//

#import "HBUserHeaderBigView.h"

@interface HBUserHeaderBigView ()


  // 请登录
@property (weak, nonatomic) IBOutlet UILabel *pleaseLogBtn;
  // 头像
@property (weak, nonatomic) IBOutlet UIButton *headViewBtn;
  // 电话号码
@property (weak, nonatomic) IBOutlet UILabel *phoneNumber;
  // 积分
@property (weak, nonatomic) IBOutlet UILabel *integral;
  // 书童
@property (weak, nonatomic) IBOutlet UILabel *livehand;
  // 书童的图片
@property (weak, nonatomic) IBOutlet UIImageView *livehandImage;
  //透明的View
@property (weak, nonatomic) IBOutlet UIView *diaphanousView;


@end




@implementation HBUserHeaderBigView

-(void)awakeFromNib{
   
    // 设置头像倒圆角
    self.headViewBtn.cornerRadius = 45;
    self.headViewBtn.borderWidth = 2;
    self.headViewBtn.borderColor = [UIColor whiteColor];


}

- (IBAction)headViewBtnClick:(UIButton *)sender {
    NSLog(@"点击了按钮");
    
    
}
#pragma mark - 加载头部的xib
+ (instancetype)loadUserHeaderBigView{
     return [[[NSBundle mainBundle]loadNibNamed:@"HBUserHeaderBigView" owner:nil options:nil]lastObject];
}




@end
