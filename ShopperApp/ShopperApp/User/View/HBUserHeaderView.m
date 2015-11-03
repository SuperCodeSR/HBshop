//
//  HBUserHeaderView.m
//  ShopperApp
//
//  Created by 李超 on 15/11/1.
//  Copyright © 2015年 清大世纪好班项目组. All rights reserved.
//

// 头像按钮的大小
#define HEAD_BTN_W 80

#import "HBUserHeaderView.h"
#import "HBheadtest2.h"
@implementation HBUserHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame =CGRectMake(0, 0, kScreenWidth  , 210);
        self.backgroundColor     = [UIColor redColor];
      
        // 布局headView上的子控件
        [self addHeaderChildSubviews];

    }
    return self;
}

#pragma mark - 布局headView上的子控件
- (void)addHeaderChildSubviews{
    
    // 头像的按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor blueColor];
    
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    btn.frame = CGRectMake(self.centerX- HEAD_BTN_W/2, self.centerY - HEAD_BTN_W/2, HEAD_BTN_W, HEAD_BTN_W);
    
    [btn.layer setMasksToBounds:YES];
    [btn.layer setCornerRadius:40];
    
    // 请登录的Lable
    UILabel *headLable = [[UILabel alloc]init];//WithFrame:CGRectMake(btn.centerX-, 20, kScreenWidth, 23)];
    headLable.text = @"请登录";
    [headLable.text sizeWithFont:[UIFont systemFontOfSize:12]];
    headLable.textColor = [UIColor whiteColor];
    headLable.x = btn.centerX-25;
    headLable.y = 30;
    [headLable sizeToFit];
    

    
    

    [self addSubview:headLable];
    
    [self addSubview:btn];
    
    
    
}


-(void)btnClick:(UIButton *)btn{
#warning todo -- 通过代理/block把点击事件传出去
    
    NSLog(@"点击了按钮");
    
}


@end
