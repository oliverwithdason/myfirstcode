//
//  DownLoadManager.h
//  异步加载网络图像、仿SDWebImage）
//
//  Created by oliverwang on 2016/10/27.
//  Copyright © 2016年 UIViewController. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DownLoadManager : NSObject
+(instancetype)shareLoadManager;

-(void)downLoadMagerWithString:(NSString*)urlString andImage:(void(^)(UIImage*))suessBlock;
-(void)cancealOperationWithString:(NSString*)urlString;
@end
