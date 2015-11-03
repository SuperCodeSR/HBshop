//
//  HBUserViewController.m
//  ShopperApp
//
//  Created by root-mac on 15/10/30.
//  Copyright © 2015年 清大世纪好班项目组. All rights reserved.
//

#import "HBUserViewController.h"
#import "HBUserHeaderView.h"
#import "HBheadtest2.h"
#import "HBUserHeaderBigView.h"
#import "HBUserBodyCell.h"


@interface HBUserViewController ()
@property (weak, nonatomic) IBOutlet UITableView *headTableView;

@property (nonatomic ,strong)NSArray *titleArray;

@property (nonatomic ,strong)NSArray *imageArray;

@end

@implementation HBUserViewController

-(NSArray *)titleArray{
    if (!_titleArray) {
        
        _titleArray = @[@"我的钱包",
                        @"我的收藏",
                        @"我的预约",
                        @"我的订单"];
        
    }
    return _titleArray;
}
-(NSArray *)imageArray{
    if (!_imageArray) {
        _imageArray = @[@"14-3",@"14-4",@"14-5",@"14-6"];
    }
    return _imageArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
    // 设置tableView的属性
    self.headTableView.bounces        = YES;
    self.headTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.headTableView.showsVerticalScrollIndicator = NO;
   
    // 自定义view -- tableview头
    // HBUserHeaderView *headerView = [[HBUserHeaderView alloc]init];
    HBUserHeaderBigView *headerView = [HBUserHeaderBigView loadUserHeaderBigView];
    self.headTableView.tableHeaderView = headerView;
    self.headTableView.backgroundColor = RGBA(246, 246, 246,1);
    
    
    
    
}
#pragma mark - UITableView 数据源方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
     return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
     if (section == 0) {
        return 4;
     }else{
   
        return 1;
    }

}
// 加载系统的cell
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    static NSString *reuseId = @"reuser";
//     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
//    if (!cell ) {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseId];
//    }
//    // cell的样式
//       cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    
//    if (indexPath.section == 0) {
//        
//        cell.textLabel.text  =self.titleArray[indexPath.row];
//        cell.imageView.image =[UIImage imageNamed:[NSString stringWithString: self.imageArray[indexPath.row]]];;
//       
//       
//        return cell;
//    }else{
//        cell.textLabel.text  =@"设置";
//        cell.imageView.image = [UIImage imageNamed:@"14-7"];
//      
//
//        
//        return cell;
//    }
//    
//   }
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
   // NSIndexPath *index = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section];
     
    return [HBUserBodyCell userBodyWith:tableView titleIndex:self.titleArray iamgeIndex:self.imageArray];
    
}

- (void)didReceiveMemoryWarning {
     [super didReceiveMemoryWarning];
}

@end
