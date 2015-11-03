//
//  HBUserBodyCell.h
//  ShopperApp
//
//  Created by 李超 on 15/11/3.
//  Copyright © 2015年 清大世纪好班项目组. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HBUserBodyCell : UITableViewCell


@property (nonatomic ,strong)NSArray *titleArray;

@property (nonatomic ,strong)NSArray *imageArray;

+ (instancetype)userBodyWith:(UITableView *)tableView titleIndex:(NSArray *)indexPath iamgeIndex:(NSArray *)iamgeIndex;


@end
