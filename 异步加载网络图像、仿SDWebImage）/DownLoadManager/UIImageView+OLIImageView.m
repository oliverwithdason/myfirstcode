//
//  UIImageView+OLIImageView.m
//  异步加载网络图像、仿SDWebImage）
//
//  Created by oliverwang on 2016/10/27.
//  Copyright © 2016年 UIViewController. All rights reserved.
//

#import "UIImageView+OLIImageView.h"
#import "DownLoadManager.h"

#import <objc/runtime.h>

const void *key = "key";
@implementation UIImageView (OLIImageView)

-(NSString *)lastString
{
    return objc_getAssociatedObject(self, key);
}

-(void)setLastString:(NSString *)lastString
{

    objc_setAssociatedObject(self, key, lastString, OBJC_ASSOCIATION_COPY);

}

-(void)instanceImageWithUrlString:(NSString*)str
{
    if(self.lastString != nil&&![self.lastString isEqualToString:str])
    {
        NSLog(@"取消");
        [[DownLoadManager shareLoadManager] cancealOperationWithString:self.lastString];
    }
    self.lastString = str;
        [[DownLoadManager shareLoadManager] downLoadMagerWithString:str andImage:^(UIImage *image) {
            self.image = image;
        }];
}
@end
