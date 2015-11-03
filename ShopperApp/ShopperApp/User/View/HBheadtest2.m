//
//  HBheadtest2.m
//  ShopperApp
//
//  Created by 李超 on 15/11/1.
//  Copyright © 2015年 清大世纪好班项目组. All rights reserved.
//

#import "HBheadtest2.h"

@interface HBheadtest2 ()

@end
@implementation HBheadtest2


+(instancetype)loadHeader{

    return [[[NSBundle mainBundle] loadNibNamed:@"HBheadtest2" owner:nil options:nil]lastObject];

}


@end
