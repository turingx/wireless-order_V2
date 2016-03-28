//
//  UserManager.h
//  wireless-order
//
//  Created by turingx on 16/3/25.
//  Copyright © 2016年 turingx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "constant.h"

@protocol UserManagerDelegate <NSObject>

-(void)notify:(BOOL)b andUsername:(NSString *) username;

@end

@interface UserManager : NSObject

-(void)login:(NSString *)username andPassword:(NSString *)password;
-(void)logout;
-(User *)getUser;

@property(nonatomic, strong)id <UserManagerDelegate> delegate;

@end
