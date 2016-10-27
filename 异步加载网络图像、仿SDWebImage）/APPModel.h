//
//  APPModel.h
//  异步加载网络图像、仿SDWebImage）
//
//  Created by oliverwang on 2016/10/27.
//  Copyright © 2016年 UIViewController. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APPModel : NSObject

@property(nonatomic,copy)NSString *name;

@property(nonatomic,copy)NSString *icon;

@property(nonatomic,copy)NSString *download;

+(instancetype)appModelWithDictionary:(NSDictionary*)dict;
@end
