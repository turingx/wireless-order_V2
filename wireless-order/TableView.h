//
//  TableView.h
//  wireless-order
//
//  Created by turingx on 16/2/20.
//  Copyright © 2016年 turingx. All rights reserved.
////haha

#import <UIKit/UIKit.h>
#import "TableManager.h"
#import "constant.h"
#import "TableCollectionViewCell.h"

@interface TableView : UIView<UICollectionViewDataSource, UICollectionViewDelegate>

-(instancetype)initWithFrame:(CGRect)frame;

@property(nonatomic, strong)TableManager *tableManager;
@property(nonatomic, strong)UICollectionView *collectionView;


@end
