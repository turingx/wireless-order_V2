//
//  User.h
//  wireless-order
//
//  Created by turingx on 16/3/25.
//  Copyright © 2016年 turingx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BmobSDK/Bmob.h>

@interface User : BmobObject

@property(nonatomic, strong)NSString *username;
@property(nonatomic, strong)NSString *password;

@end
