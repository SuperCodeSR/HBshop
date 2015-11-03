//
//  NSString+Extension.m
//  ShopperApp
//
//  Created by 李超 on 15/11/1.
//  Copyright © 2015年 清大世纪好班项目组. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

- (CGSize)sizeWithFont:(UIFont *)font{
  
    NSDictionary *att = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    
    return [self sizeWithAttributes:att];
}

- (CGSize)sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size{
  
    NSDictionary *att = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:att context:nil].size;
    
}

@end
