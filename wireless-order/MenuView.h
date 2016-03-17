//
//  MenuView.h
//  wireless-order
//
//  Created by turingx on 16/2/20.
//  Copyright © 2016年 turingx. All rights reserved.
////haha

#import <UIKit/UIKit.h>
#import "MenuCollectionViewCell.h"
#import "Menu.h"
#import "DBUtil.h"
#import "constant.h"
#import "BBBadgeBarButtonItem.h"
#import "OrderMenu.h"

@interface MenuView : UIView<UICollectionViewDataSource,UICollectionViewDelegate>

-(instancetype)initWithFrame:(CGRect)frame;

@property(nonatomic, strong)UICollectionView *collectionView;
@property(nonatomic, strong)NSMutableArray *datasource;
@property(nonatomic, strong)DBUtil *util;

@property(nonatomic, strong)UISegmentedControl *seg;

@property(nonatomic,strong)NSMutableArray *menuTypeDatasource;

@property(nonatomic, strong)NSMutableArray *orderMenuDatasource;

@property(nonatomic, strong)BBBadgeBarButtonItem *barButton;




@end
