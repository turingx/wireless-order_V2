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

@interface MenuListViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong)NSMutableArray *orderDataSource;
@property(nonatomic, strong)UITableView *tv;

@end
