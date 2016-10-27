//
//  OLIOperation.m
//  异步加载网络图像、仿SDWebImage）
//
//  Created by oliverwang on 2016/10/27.
//  Copyright © 2016年 UIViewController. All rights reserved.
//

#import "OLIOperation.h"
#import "NSString+Extension.h"

@interface OLIOperation ()
@property(nonatomic,copy)NSString* urlString;
@end
@implementation OLIOperation

+(instancetype)instanceOperationWithURL:(NSString*)urlString
{
    OLIOperation *op = [[OLIOperation alloc] init];
    op.urlString = urlString;
    return op;
}

-(void)main
{
if(self.urlString != nil)
{
    if(self.isCancelled)
    {
        NSLog(@"取消1");
        return;
    }
    NSURL *url = [NSURL URLWithString:self.urlString];
    
    NSData *data =[NSData dataWithContentsOfURL:url];
    
    if(self.isCancelled)
    {
        NSLog(@"取消");
        return;
    }
   
    self.image = [UIImage imageWithData:data];
//    NSString *path = [_urlString lastPathComponent];
    [data writeToFile:[_urlString extensionPath] atomically:YES];
    
    NSLog(@"%@",[_urlString extensionPath] );
}

}

@end
