//
//  Menu.h
//  wireless-order
//
//  Created by turingx on 16/2/21.
//  Copyright © 2016年 turingx. All rights reserved.
//

#import <BmobSDK/Bmob.h>

@interface Menu : Bmob

@property(nonatomic, copy)NSString *objectid;
@property(nonatomic, copy)NSString *name;
@property(nonatomic, assign)float price;
@property(nonatomic, copy)NSString *tid; //分类id
@property(nonatomic, copy)NSString *picture_path; //图片路径
@property(nonatomic, copy)NSString *desc;  //描述



@end
