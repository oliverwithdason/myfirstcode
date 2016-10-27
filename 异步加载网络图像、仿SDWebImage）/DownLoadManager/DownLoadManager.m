//
//  DownLoadManager.m
//  异步加载网络图像、仿SDWebImage）
//
//  Created by oliverwang on 2016/10/27.
//  Copyright © 2016年 UIViewController. All rights reserved.
//

#import "DownLoadManager.h"
#import "OLIOperation.h"
#import "NSString+Extension.h"

@interface DownLoadManager ()

@property(nonatomic,strong)NSOperationQueue *queque;

//图片缓冲池
@property(nonatomic,strong)NSMutableDictionary *imageCache;

//operation操作
@property(nonatomic,strong) NSMutableDictionary *operationCache;

@end

@implementation DownLoadManager
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.queque = [[NSOperationQueue alloc] init];
        
        self.imageCache = [NSMutableDictionary dictionary];
        
        self.operationCache = [[NSMutableDictionary alloc] init];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(clear) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
    }
    return self;
}

-(void)clear
{
    [self.operationCache removeAllObjects];
    
    [self.imageCache removeAllObjects];
    
    [self.queque cancelAllOperations];

}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];

}

+(instancetype)shareLoadManager
{
    static id instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[DownLoadManager alloc] init];
    });
    return instance;
}

-(void)downLoadMagerWithString:(NSString*)urlString andImage:(void(^)(UIImage*))suessBlock
{
    //判断缓冲池中是否有图片
    UIImage *image = [self.imageCache objectForKey:urlString];
    if(image != nil)
    {
        NSLog(@"缓存中");
        if(suessBlock != nil)
        {
            suessBlock(image);
            return;
        }
    }
    //判断沙盒是否有图片
    UIImage *im = [UIImage imageWithContentsOfFile:[urlString extensionPath]];
    if(im != nil)
    {
        NSLog(@"沙盒中");
        if(suessBlock != nil)
        {
            suessBlock(im);
            [self.imageCache setObject:im forKey:urlString];
            return;
        }
    }
    //判断是否加载
    OLIOperation *oper = [self.operationCache objectForKey:urlString];
    if(oper != nil)
    {
        NSLog(@"下载 中");
    }
    
    OLIOperation *op = [OLIOperation instanceOperationWithURL:urlString];
    __weak typeof(op) weakOp = op;
    
    [op setCompletionBlock:^{
        UIImage *im = weakOp.image;
        NSLog(@"我在下载中-------");
        if(im != nil)
        {
            [self.imageCache setObject:im forKey:urlString];
            
            [self.operationCache removeObjectForKey:urlString];
            
            if (suessBlock != nil)
            {
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    suessBlock(im);
                }];
            }}
    }];
    
    [self.operationCache setObject:op forKey:urlString];
    [self.queque addOperation:op];
}

-(void)cancealOperationWithString:(NSString*)urlString
{
    if(urlString != nil)
    {
        OLIOperation *opc = [self.operationCache objectForKey:urlString];
        [opc isCancelled];
        [self.operationCache removeObjectForKey:urlString];
    }
}

@end
