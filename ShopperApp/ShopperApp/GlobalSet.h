//
//  GlobalSet.h
//  ShopperApp
//
//  Created by root-mac on 15/10/30.
//  Copyright © 2015年 清大世纪好班项目组. All rights reserved.
//

#ifndef GlobalSet_h
#define GlobalSet_h

#define kScreenSize           [[UIScreen mainScreen] bounds].size                 //(e.g. 320,480)
#define kScreenWidth          [[UIScreen mainScreen] bounds].size.width           //(e.g. 320)
#define kScreenHeight         [[UIScreen mainScreen] bounds].size.height          //包含状态bar的高度(e.g. 480)

#define kApplicationSize      [[UIScreen mainScreen] applicationFrame].size       //(e.g. 320,460)
#define kApplicationWidth     [[UIScreen mainScreen] applicationFrame].size.width //(e.g. 320)
#define kApplicationHeight    [[UIScreen mainScreen] applicationFrame].size.height//不包含状态bar的高度(e.g. 460)

#import "UIView+Extension.h"
#import "UIView+Inspectable.h"
#import "NSString+Extension.h"

/*================================================================================================*/
/* 环境配置 */
#ifndef Configure_Environment
#define Configure_Environment 1  // 1:stg 测试环境 2:prd 生产环境 ...

/*********************stg环境*********************/
#if Configure_Environment== 1

//#define BaseApi   @"http://sopapis.oozuoye.cn" // alpha 环境
#define BaseApi   @"http://192.168.2.50:8080/ShopperApi"   // 李文的环境

/*********************prd环境*********************/
#elif Configure_Environment== 2

#define BaseApi   @""

#endif

#endif



#ifdef DEBUG
#    define DLog(...) NSLog(__VA_ARGS__)
#else
#    define DLog(...)
#endif


#define iOS8 ([[[UIDevice currentDevice]systemVersion] floatValue] >= 8.0)?YES:NO


#define Auth_Key  @"ttJw6Oc4NEtwPf8CbmwLNQ=="


//三色值
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:g/255.0 alpha:a]

//定义全局的一些颜色值和字体






#endif /* GlobalSet_h */
