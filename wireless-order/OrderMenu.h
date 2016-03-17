//
//  OrderMenu.h
//  wireless-order
//
//  Created by turingx on 16/3/17.
//  Copyright © 2016年 turingx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderMenu : UICollectionViewCell

@property(nonatomic, copy)NSString *mid;
@property(nonatomic, copy)NSString *name;
@property(nonatomic, assign)int num;
@property(nonatomic, assign)float price;
@property(nonatomic, assign)float total;


@end
