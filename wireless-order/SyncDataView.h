//
//  SyncDataView.h
//  wireless-order
//
//  Created by turingx on 16/2/20.
//  Copyright © 2016年 turingx. All rights reserved.
////haha

#import <UIKit/UIKit.h>
#import "MenuManager.h"

@interface SyncDataView : UIView<UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>


@property(nonatomic, strong)UITableView *tv;
@property(nonatomic, strong)NSArray *dataSource;

@property(nonatomic, strong)MenuManager *menuManager;

-(instancetype)initWithFrame:(CGRect)frame;

@end
