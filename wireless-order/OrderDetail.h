//
//  OrderDetail.h
//  wireless-order
//
//  Created by turingx on 16/3/26.
//  Copyright © 2016年 turingx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BmobSDK/Bmob.h>

@interface OrderDetail : NSObject

@property(nonatomic, copy)NSString *oid;
@property(nonatomic, copy)NSString *mid;
@property(nonatomic, copy)NSString *desc;
@property(nonatomic, assign)int num;

@end
