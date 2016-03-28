//
//  Order.h
//  wireless-order
//
//  Created by turingx on 16/3/26.
//  Copyright © 2016年 turingx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BmobSDK/Bmob.h>

@interface Order : BmobObject

@property(nonatomic, copy)NSString *uid;
@property(nonatomic, copy)NSString *tid;
@property(nonatomic, copy)NSString *desc;
@property(nonatomic, assign)int isPay;

@end
