//
//  HBUserBodyCell.m
//  ShopperApp
//
//  Created by 李超 on 15/11/3.
//  Copyright © 2015年 清大世纪好班项目组. All rights reserved.
//

#import "HBUserBodyCell.h"


@interface HBUserBodyCell ()
// 图标
@property (weak, nonatomic) IBOutlet UIImageView *iconViewImage;

// 我的xxx
@property (weak, nonatomic) IBOutlet UILabel *userTitle;


// 提示红se引用次数
@property (weak, nonatomic) IBOutlet UIView *cueNumber;


@end
@implementation HBUserBodyCell




//+ (instancetype)userBodyWith:(UITableView *)tableView titleIndex:(NSArray *)indexPath iamgeIndex:(NSArray *)iamgeIndex{
//    
//    static NSString *userBodyID = @"userBody";
//    HBUserBodyCell *cell = [tableView dequeueReusableCellWithIdentifier:userBodyID];
//    if (!cell) {
//        cell = [[[NSBundle mainBundle]loadNibNamed:@"HBUserBodyCell" owner:nil options:nil]lastObject];
//    }
//    [cell setSeparatorInset:UIEdgeInsetsZero];
//
//    NSLog(@"%@,%@",indexPath,iamgeIndex);
////    cell.iconViewImage.image = [UIImage imageNamed:];
//    for (NSString *titleStr in indexPath ) {
//        NSLog(@"%@",titleStr);
//        cell.userTitle.text = titleStr;
//    }
//    
//    return cell;
//    
//    
//    
//}

+ (instancetype)userBodyWith:(UITableView *)tableView titleIndex:(NSArray *)indexPath iamgeIndex:(NSArray *)iamgeIndex{
    
    static NSString *userBodyID = @"userBody";
    HBUserBodyCell *cell = [tableView dequeueReusableCellWithIdentifier:userBodyID];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"HBUserBodyCell" owner:nil options:nil]lastObject];
    }
    [cell setSeparatorInset:UIEdgeInsetsZero];
    
    NSLog(@"%@,%@",indexPath,iamgeIndex);
    //    cell.iconViewImage.image = [UIImage imageNamed:];
//    NSArray *arr =@[@"我的钱包",
//                    @"我的收藏",
//                    @"我的预约",
//                    @"我的订单"];
//    
//    for (int i= 0;i < arr.count;i++) {
//       
//        cell.userTitle.text = arr[i];
//    }
    return cell;

}




- (void)awakeFromNib {
    self.cueNumber.cornerRadius = 8;


}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
