//
//  HBRequest.h
//  ShopperApp
//
//  Created by root-mac on 15/11/1.
//  Copyright © 2015年 清大世纪好班项目组. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HBRequest : NSObject


+ (void)getCouresListUrlApi:(NSString *)url
                 parameters:(NSDictionary *)parameter
                    success:(void (^) (id responseObject) )success
                    failure:(void (^)(NSError *error))failure;

@end
