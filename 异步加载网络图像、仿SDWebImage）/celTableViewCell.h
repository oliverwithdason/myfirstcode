//
//  celTableViewCell.h
//  异步加载网络图像、仿SDWebImage）
//
//  Created by oliverwang on 2016/10/27.
//  Copyright © 2016年 UIViewController. All rights reserved.
//

#import <UIKit/UIKit.h>
@class APPModel;

@interface celTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *downLoadLabel;

//@property(nonatomic,strong) APPModel *model;

@end
