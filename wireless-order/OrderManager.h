//
//  OrderManager.h
//  wireless-order
//
//  Created by turingx on 16/3/26.
//  Copyright © 2016年 turingx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Order.h"
#import "OrderDetail.h"
#import <BmobSDK/Bmob.h>


@protocol OrderManagerDelegate <NSObject>

-(void)notify:(NSString *) oid;

@end

@interface OrderManager : NSObject

-(void)addOrder:(Order *) o;
-(void)addOrderDetail:(OrderDetail *) od;

@property(nonatomic, strong)id <OrderManagerDelegate> delegate;

@end
