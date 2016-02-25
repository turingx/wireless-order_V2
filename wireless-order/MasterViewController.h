//
//  MasterViewController.h
//  wireless-order
//
//  Created by turingx on 16/2/20.
//  Copyright © 2016年 turingx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuView.h"
#import "PayView.h"
#import "SettingView.h"
#import "SyncDataView.h"
#import "TableView.h"
#import "DetailViewController.h"
#import "MenuManager.h"

@interface MasterViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>


//数据源和主菜单视图属性
@property(nonatomic, strong)UITableView *tv;
@property(nonatomic, strong)NSMutableArray *datasource;


//主视图菜单栏目跳转视图属性
@property(nonatomic, strong)MenuView *menuView;
@property(nonatomic, strong)TableView *tableView;
@property(nonatomic, strong)PayView *payView;
@property(nonatomic, strong)SyncDataView *syncDataView;
@property(nonatomic, strong)SettingView *settingView;

//Detail视图属性
@property(nonatomic, strong)DetailViewController *detail;

//菜单管理属性
@property(nonatomic, strong)MenuManager *menuManager;

@end
