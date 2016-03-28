//
//  OrderManager.m
//  wireless-order
//
//  Created by turingx on 16/3/26.
//  Copyright © 2016年 turingx. All rights reserved.
//

#import "OrderManager.h"


@implementation OrderManager

-(void)addOrder:(Order *) o{
    
    BmobObject  *order = [BmobObject objectWithClassName:@"OrderTbl"];

    [order setObject:[NSNumber numberWithInt:o.isPay] forKey:@"isPay"];
  
    [order setObject:o.uid forKey:@"uid"];
    [order setObject:o.tid forKey:@"tid"];
    [order setObject:o.desc forKey:@"description"];
    
    [order saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
        if (isSuccessful) {
             NSLog(@"%@",order.objectId);
            [self.delegate notify:order.objectId];
            
        } else if (error){
           NSLog(@"%@",error);
        } else {
            NSLog(@"Unknow error");

        }
    }];

}
-(void)addOrderDetail:(OrderDetail *) od{
    
    BmobObject  *orderDetail = [BmobObject objectWithClassName:@"OrderDetail"];
    
    [orderDetail setObject:[NSNumber numberWithInt:od.num] forKey:@"num"];
    
    [orderDetail setObject:od.oid forKey:@"oid"];
    [orderDetail setObject:od.mid forKey:@"mid"];
    [orderDetail setObject:od.desc forKey:@"description"];
    
    [orderDetail saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
        if (isSuccessful) {
            
            NSLog(@"%@",orderDetail.objectId);
            
        } else if (error){
             NSLog(@"%@",error);
        } else {
             NSLog(@"Unknow error");
        }
    }];
}

@end

