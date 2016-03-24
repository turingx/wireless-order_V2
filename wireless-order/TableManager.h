//
//  tableManager.h
//  wireless-order
//
//  Created by turingx on 16/3/23.
//  Copyright © 2016年 turingx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BmobSDK/Bmob.h>
#import "Table.h"

@interface TableManager : UITableViewCell


@property(nonatomic, strong)NSMutableArray *allTableList, *emptyTableList, *busyTableList;

-(void)queryAllTable;
-(void)queryEmptyTable;
-(void)queryBusyTable;



@end
