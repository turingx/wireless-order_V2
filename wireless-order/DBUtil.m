//
//  DBUtil.m
//  wireless-order
//
//  Created by turingx on 16/2/25.
//  Copyright © 2016年 turingx. All rights reserved.
//

#import "DBUtil.h"

@implementation DBUtil

static DBUtil * instance = nil;  //静态实例实现单例设计模式


+(DBUtil *)getIntance{    //

    if (instance == nil) {
        instance = [[DBUtil alloc] init];
    }
    
    return instance;
    
}

-(instancetype)init{
    
    self = [super init];
    if (self) {
        NSArray *docPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *path = [docPaths objectAtIndex:0];
        
       // NSLog(@"db path = %@", path);
        //创建数据库路径
        
        self.path = [path stringByAppendingPathComponent:@"wireless.db"];
        
        self.db = [FMDatabase databaseWithPath:self.path];
        
        [self open];
        [self createTable];
        [self close];
    
    }
    
    return self;
}

-(void)open{

    if (! [self.db open]) {
        return;
    }
}

-(void)close{

    [self.db close];
}

-(void)createTable{

      NSString *sql = @"create table if not exists MenuTbl(objectid text, name text, price real, tid text, pic_path text, description text)";
    
    NSString *sql2 = @"create table if not exists MenuTypeTbl(objectid text, name text)";
    
    [self.db executeUpdate:sql];
    [self.db executeUpdate:sql2];
    
}


-(void)addMenuType:(MenuType *)mt{

    [self open];
    NSString *sql = @"insert into MenuTypeTbl(objectid, name)values(?,?)";
    BOOL r = [self.db executeUpdate:sql, mt.objectid, mt.name];
    if (r) {
        NSLog(@"添加菜单分类成功！");
    }else{
    NSLog(@"添加菜单分类失败！");
    }
    
    [self close];
}

-(void)deleteAllMenuType{

    [self open];
    NSString *sql = @"delete from MenuTypeTbl";
    [self.db executeUpdate:sql];
    [self close];
}

-(void)addMenu:(Menu *)m{

    [self open];
    NSString *sql = @"insert into MenuTbl(objectid, name, price, tid, pic_path,  description)values(?, ?, ?, ?, ?, ?)";
    BOOL r1 =  [self.db executeUpdate:sql, m.objectid, m.name, [NSNumber numberWithFloat:m.price], m.tid, m.picture_path, m.desc];
    if (r1) {
        NSLog(@"添加菜单成功！");
    }else{
        NSLog(@"添加菜单失败！");
    }
    
    [self close];
    
}

-(void)deleteAllMenu{
    
    [self open];
    NSString *sql = @"delete from MenuTypeTbl";
    [self.db executeUpdate:sql];
    [self close];
}

-(NSMutableArray *)queryMenu{  //查询Menu

    [self open];
    
    FMResultSet *s = [self.db executeQuery:@"SELECT * FROM MenuTbl"];
    NSMutableArray *temp = [NSMutableArray arrayWithCapacity:10];
    
    while ([s next]) {
        
        NSString *objectid = [s stringForColumn:@"objectid"];
        NSString *name = [s stringForColumn:@"name"];
        float price = [s doubleForColumn:@"price"];
        NSString *tid = [s stringForColumn:@"tid"];
        NSString *pic_path = [s stringForColumn:@"pic_path"];
        //NSLog(@"pic_path = %@", pic_path);
        
        NSString *description = [s stringForColumn:@"description"];
        
        Menu *m = [[Menu alloc] init];
        m.objectid = objectid;
        m.name = name;
        m.picture_path = pic_path;
        m.price = price;
        m.tid = tid;
        m.desc = description;
        [temp addObject:m];
    }
    
    [self close];
    
    return temp;
    
}

-(NSMutableArray *)queryMenuById:(NSString *)tid{

    [self open];
    
    FMResultSet *s = [self.db executeQuery:@"SELECT * FROM MenuTbl WHERE tid = ?", tid];
    NSMutableArray *temp = [NSMutableArray arrayWithCapacity:10];
    
    while ([s next]) {
        
        NSString *objectid = [s stringForColumn:@"objectid"];
        NSString *name = [s stringForColumn:@"name"];
        float price = [s doubleForColumn:@"price"];
        NSString *tid = [s stringForColumn:@"tid"];
        NSString *pic_path = [s stringForColumn:@"pic_path"];
        //NSLog(@"pic_path = %@", pic_path);
        
        NSString *description = [s stringForColumn:@"description"];
        
        Menu *m = [[Menu alloc] init];
        m.objectid = objectid;
        m.name = name;
        m.picture_path = pic_path;
        m.price = price;
        m.tid = tid;
        m.desc = description;
        [temp addObject:m];
    }
    
    [self close];
    
    return temp;
}


-(NSMutableArray *)queryMenuType{

    [self open];
    
    FMResultSet *s = [self.db executeQuery:@"SELECT * FROM MenuTypeTbl" ];
    NSMutableArray *temp = [NSMutableArray arrayWithCapacity:10];
    
    while ([s next]) {
        
        NSString *objectid = [s stringForColumn:@"objectid"];
        NSString *name = [s stringForColumn:@"name"];
       
        Menu *m = [[Menu alloc] init];
        m.objectid = objectid;
        m.name = name;

        [temp addObject:m];
    }
    
    [self close];
    
    return temp;

}

@end
