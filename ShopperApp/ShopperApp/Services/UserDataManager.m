//
//  UserDataManager.m
//  ShopperApp
//
//  Created by root-mac on 15/11/1.
//  Copyright © 2015年 清大世纪好班项目组. All rights reserved.
//

#import "UserDataManager.h"

@implementation UserDataManager


+ (instancetype)sharedManager{

    static UserDataManager *_sharedManager = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedManager = [[self alloc]init];
    });
    
    return _sharedManager;
}


- (void)saveUserData{

    
}

- (void)clearUserData{

}



@end
