//
//  DBUtil.h
//  wireless-order
//
//  Created by turingx on 16/2/25.
//  Copyright © 2016年 turingx. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FMDatabaseQueue.h"
#import "FMDatabase.h"
#import "Menu.h"
#import "MenuType.h"
//#import "User.h"
//#import "OrderDetail.h"
//#import "Order.h"


@interface DBUtil : NSObject

@property(nonatomic, strong)NSString *path;  //数据库保存路径
@property(nonatomic, strong)FMDatabase *db;  //数据库实例


+(DBUtil *)getIntance;

-(void)open;  //打开数据库
-(void)close; //关闭数据库

-(void)createTable;  //创建表

-(void)addMenu:(Menu *)m;  //添加菜单

-(void)deleteAllMenu;  //删除所有菜单

-(void)addMenuType:(MenuType *)mt;  //添加菜单分类

-(void)deleteAllMenuType;  //删除所有菜单分类

-(NSMutableArray *)queryMenu;  //查询Menu

-(NSMutableArray *)queryMenuById:(NSString *)tid;  //根据tid查询

-(NSMutableArray *)queryMenuType;  //查询MenuType


@end
