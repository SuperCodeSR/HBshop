//
//  UserDataManager.h
//  ShopperApp
//
//  Created by root-mac on 15/11/1.
//  Copyright © 2015年 清大世纪好班项目组. All rights reserved.
//

#import <Foundation/Foundation.h>



//保存用户信息

@interface UserDataManager : NSObject

@property (nonatomic, strong, readonly) NSString *nickname;
@property (nonatomic, strong, readonly) NSString *avatarUrl;
@property (nonatomic, assign, readonly) BOOL isLogin;


+ (instancetype)sharedManager;

- (void)saveUserData;

- (void)clearUserData;

@end
