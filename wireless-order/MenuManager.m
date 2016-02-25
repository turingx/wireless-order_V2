//
//  MenuManager.m
//  wireless-order
//
//  Created by turingx on 16/2/21.
//  Copyright © 2016年 turingx. All rights reserved.
//

#import "MenuManager.h"

@implementation MenuManager


-(instancetype)init{

    self = [super init];
    if (self) {
        
        self.util = [DBUtil getIntance];
        return self;
    }
    return nil;

}

-(void)syncMenu{   //同步菜单
    
    
    BmobQuery   *bquery = [BmobQuery queryWithClassName:@"MenuTbl"];
    
    [self.util deleteAllMenu];
    
    [bquery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
        for (BmobObject *obj in array) {
            
            NSString *objectId = [obj objectId];
            NSString *name = [obj objectForKey:@"name"];
            NSString  *price = [obj objectForKey:@"price"];
            NSString *tid = [obj objectForKey:@"tid"];
            NSString *desc = [obj objectForKey:@"description"];
            
            BmobFile *file = [obj objectForKey:@"picture"];
            NSString *url = file.url;
            
            Menu *m = [[Menu alloc] init];
            m.objectid = objectId;
            m.name = name;
            m.price = [price floatValue];
            m.tid = tid;
            m.desc = desc;
            
//            NSLog(@"name = %@", name);
//            NSLog(@"objectId = %@", objectId);
//            NSLog(@"tid = %@", tid);
//            NSLog(@"desc = %@", desc);
            
            
          [self donwload:url andMenu:m];
         
        }
    }];
    
}

//同步菜单分类
-(void)syncMenuType{
    
    
    
    BmobQuery   *bquery = [BmobQuery queryWithClassName:@"MenuTypeTbl"];

    [self.util deleteAllMenu];
    
    [bquery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
        for (BmobObject *obj in array) {

            NSString *objectId = [obj objectId];
            NSString *name = [obj objectForKey:@"name"];
      
//            NSLog(@"name = %@", [obj objectForKey:@"name"]);
//            NSLog(@"objectId = %@", [obj objectId]);
            
            MenuType *mt = [[MenuType alloc] init];
            mt.objectid = objectId;
            mt.name = name;
            
      [self.util addMenuType:mt];
        }
    }];
    
}


-(void)donwload:(NSString *) url andMenu:(Menu *) m{   //创建图片下载方法，使用的是AFnetworking这个类
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        NSLog(@"File downloaded to: %@", filePath);  //打印文件下载路径
        
        NSString *fileName = [response suggestedFilename];
        m.picture_path = fileName;
        
        [self.util addMenu:m];
        
    }];
    [downloadTask resume];
    
}

@end
