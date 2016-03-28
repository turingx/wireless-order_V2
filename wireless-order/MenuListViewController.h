//
//  MenuListViewController.h
//  wireless-order
//
//  Created by turingx on 16/3/17.
//  Copyright © 2016年 turingx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderMenu.h"
#import "orderListTableViewCell.h"
#import "TableManager.h"
#import "Table.h"
#import "OrderManager.h"
#import "Order.h"
#import "OrderDetail.h"
#import "UserManager.h"



@interface MenuListViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate,TableManagerDelegate, OrderManagerDelegate>

@property(nonatomic, strong)NSMutableArray *orderDataSource;
@property(nonatomic, strong)UITableView *tv;

@property(nonatomic, strong)UIPickerView *pickerView;

@property(nonatomic, strong)TableManager *tableManager;
@property(nonatomic, strong)NSMutableArray *tableList;

@property(nonatomic, strong)UIButton *orderBtn;

@property(nonatomic, strong)OrderManager *orderManager;

@property(nonatomic, strong)UserManager *userManager;

@property(nonatomic, strong)Table *currentTable;


@end
