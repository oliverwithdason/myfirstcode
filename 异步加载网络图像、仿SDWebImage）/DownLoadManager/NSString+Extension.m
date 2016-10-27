//
//  NSString+Extension.m
//  异步加载网络图像、仿SDWebImage）
//
//  Created by oliverwang on 2016/10/27.
//  Copyright © 2016年 UIViewController. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)


-(NSString*)extensionPath
{
//得到沙盒路径
    NSString *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    
    //得到图片的名字
    NSString *str = [self lastPathComponent];
    
    NSString *pathString = [path stringByAppendingFormat:@"/%@",str];
    
    return pathString;
}

-(NSString *)appendCachePath
{
    NSString *str = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    
    NSString *str1 = [self lastPathComponent];
    
    NSString *pathFile = [str stringByAppendingFormat:@"/%@",str1];
    return pathFile;
}
@end
