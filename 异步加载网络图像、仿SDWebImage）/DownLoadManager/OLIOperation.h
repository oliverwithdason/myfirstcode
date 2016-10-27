//
//  OLIOperation.h
//  异步加载网络图像、仿SDWebImage）
//
//  Created by oliverwang on 2016/10/27.
//  Copyright © 2016年 UIViewController. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface OLIOperation : NSOperation

+(instancetype)instanceOperationWithURL:(NSString*)urlString;

@property(nonatomic,strong)UIImage *image;

@end
