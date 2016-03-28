//
//  UserManager.m
//  wireless-order
//
//  Created by turingx on 16/3/25.
//  Copyright © 2016年 turingx. All rights reserved.
//

#import "UserManager.h"

@implementation UserManager

-(void)login:(NSString *)username andPassword:(NSString *)password{
    
    BmobQuery   *bquery = [BmobQuery queryWithClassName:@"UserTbl"];
    
    [bquery whereKey:@"username" equalTo:username];
    [bquery whereKey:@"password" equalTo:password];
    
    [bquery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {

        if(array.count > 0){
            
            BmobObject *obj =[array objectAtIndex:0];
            
            NSString *objectId = [obj objectId];
            NSString *username = [obj objectForKey:@"username"];
            NSString  *password = [obj objectForKey:@"password"];
        
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            
            [userDefaults setObject:username forKey:USERNAME];
            [userDefaults setObject:password forKey:PASSWORD];
            [userDefaults setObject:objectId forKey:OBJECTID];
            
    
            
            [self.delegate notify:YES andUsername:username];

        }else{
        
            [self.delegate notify:NO andUsername:nil];

        }
           
    }];

}

-(void)logout{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setObject:nil forKey:USERNAME];
    [userDefaults setObject:nil forKey:PASSWORD];
    [userDefaults setObject:nil forKey:OBJECTID];

}

-(User *)getUser{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *objectid = [userDefaults objectForKey:OBJECTID];
    if (objectid == nil) {
        return nil;
    }else{
        User *u =[[User alloc] init];
        NSString *username = [userDefaults objectForKey:USERNAME];
        NSString *passwrod = [userDefaults objectForKey:PASSWORD];
        
        u.objectId = objectid;
        u.username = username;
        u.password = passwrod;
        return u;
    }
    
}

@end
