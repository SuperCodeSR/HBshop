//
//  NSString+Extension.h
//  ShopperApp
//
//  Created by 李超 on 15/11/1.
//  Copyright © 2015年 清大世纪好班项目组. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

- (CGSize)sizeWithFont:(UIFont *)font;

- (CGSize)sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;

@end
