//
//  UIImageView+OLIImageView.h
//  异步加载网络图像、仿SDWebImage）
//
//  Created by oliverwang on 2016/10/27.
//  Copyright © 2016年 UIViewController. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (OLIImageView)

-(void)instanceImageWithUrlString:(NSString*)str;

@property(nonatomic,copy)NSString *lastString;

@end
