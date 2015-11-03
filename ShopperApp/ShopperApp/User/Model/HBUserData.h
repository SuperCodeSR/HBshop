//
//  HBUserData.h
//  ShopperApp
//
//  Created by 李超 on 15/11/3.
//  Copyright © 2015年 清大世纪好班项目组. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HBUserData : NSObject

// 图标
@property (weak, nonatomic) UIImageView *iconViewImage;

// 我的xxx
@property (weak, nonatomic) UILabel *userTitle;


// 提示红se引用次数
@property (weak, nonatomic) UIView *cueNumber;

@end
