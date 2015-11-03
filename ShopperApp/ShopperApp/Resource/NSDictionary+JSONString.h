//
//  NSDictionary+JSONString.h
//  ShopperApp
//
//  Created by root-mac on 15/11/1.
//  Copyright © 2015年 清大世纪好班项目组. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JSONString)

-(NSString*) jsonStringWithPrettyPrint:(BOOL) prettyPrint;

@end
