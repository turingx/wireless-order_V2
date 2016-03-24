//
//  tableManager.m
//  wireless-order
//
//  Created by turingx on 16/3/23.
//  Copyright © 2016年 turingx. All rights reserved.
//

#import "tableManager.h"

@implementation TableManager


-(instancetype)init{

    self = [super init];
    if (self) {
        
        self.allTableList = [NSMutableArray arrayWithCapacity:10];
        self.emptyTableList = [NSMutableArray arrayWithCapacity:10];
        self.busyTableList = [NSMutableArray arrayWithCapacity:10];
        return self;
    }
    
    return nil;
}

-(void)queryAllTable{
    
    
    
    
    BmobQuery   *bquery = [BmobQuery queryWithClassName:@"TableTbl"];
    
    
    
    [bquery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
        for (BmobObject *obj in array) {
            
            NSString *objectId = [obj objectId];
            NSString *num = [obj objectForKey:@"table_number"];
            NSString  *flag = [obj objectForKey:@"flag"];
            
            NSLog(@"%@", num);
           
            Table *t = [[Table alloc] init];
            
            t.objectId = objectId;
            t.num = [num intValue];
            t.flag = [flag intValue];


            [self.allTableList addObject:t];


        }
        
        [self.delegate notifyAllTables];
    }];
}


-(void)queryEmptyTable{
    
    
    BmobQuery   *bquery = [BmobQuery queryWithClassName:@"TableTbl"];
    
    [bquery whereKey:@"flag" equalTo:[NSNumber numberWithInt:0]];
    
    
    [bquery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
        for (BmobObject *obj in array) {
            
            NSString *objectId = [obj objectId];
            NSString *num = [obj objectForKey:@"table_number"];
            NSString  *flag = [obj objectForKey:@"flag"];
            
            Table *t = [[Table alloc] init];
            
            t.objectId = objectId;
            t.num = [num intValue];
            t.flag = [flag intValue];
            
            
            [self.emptyTableList addObject:t];
        }
        
        [self.delegate notifyEmptyTables];
    }];
    
}



-(void)queryBusyTable{
    
    BmobQuery   *bquery = [BmobQuery queryWithClassName:@"TableTbl"];
    
    [bquery whereKey:@"flag" equalTo:[NSNumber numberWithInt:1]];
    
    
    [bquery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
        for (BmobObject *obj in array) {
            
            NSString *objectId = [obj objectId];
            NSString *num = [obj objectForKey:@"table_number"];
            NSString  *flag = [obj objectForKey:@"flag"];
            
            Table *t = [[Table alloc] init];
            
            t.objectId = objectId;
            t.num = [num intValue];
            t.flag = [flag intValue];
            
            
            [self.busyTableList addObject:t];
        }
        
        [self.delegate notifyBusyTables];
    }];
    
}




@end

