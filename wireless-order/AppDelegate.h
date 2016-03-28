//
//  AppDelegate.h
//  wireless-order
//
//  Created by turingx on 16/2/20.
//  Copyright © 2016年 turingx. All rights reserved.
////haha

#import <UIKit/UIKit.h>
#import "MasterViewController.h"
#import "DetailViewController.h"
#import "constant.h"
#import "UserManager.h"
#import "User.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, UIAlertViewDelegate, UserManagerDelegate>

@property(nonatomic, strong)UISplitViewController *split;
@property(nonatomic, strong)MasterViewController *master;
@property(nonatomic,strong)DetailViewController *detail;

@property(nonatomic, strong)UIBarButtonItem *rightItem;
@property(nonatomic, strong)UserManager *userManager;


@property (strong, nonatomic) UIWindow *window;



@end

