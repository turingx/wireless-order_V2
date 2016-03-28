//
//  AppDelegate.m
//  wireless-order
//
//  Created by turingx on 16/2/20.
//  Copyright © 2016年 turingx. All rights reserved.
////haha

#import "AppDelegate.h"
#import <BmobSDK/Bmob.h>  //导入Bmob的SDK（Bmob是第三方免费的云数据库）

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
   // 1.master  设置标题和导航视图
    self.master = [[MasterViewController alloc] init];
    UINavigationController *masterNav = [[UINavigationController alloc]initWithRootViewController:self.master];
    self.master.title = @"无线点餐";
    
    //2.detail
    self.detail = [[DetailViewController alloc] init];
    UINavigationController *detailNav = [[UINavigationController alloc]initWithRootViewController:self.detail];
    
    self.master.detail = self.detail;
    
    User *u = [self.userManager getUser];
    if (u == nil) {
        
        self.rightItem = [[UIBarButtonItem alloc] initWithTitle:@"登陆" style:UIBarButtonItemStylePlain target:self action:@selector(login)];
        
        ;
    }else{
    
    self.rightItem = [[UIBarButtonItem alloc] initWithTitle:@"退出" style:UIBarButtonItemStylePlain target:self action:@selector(logout)];
    
        self.detail.title = u.username;
        
    }
    self.detail.navigationItem.rightBarButtonItem = self.rightItem;
    
    //3.split
    self.split = [[UISplitViewController alloc] init];
    self.split.viewControllers = @[masterNav, detailNav];
    self.split.maximumPrimaryColumnWidth = MAX_WIDTH;   //导入constant.h里定义的宽度
    
    self.window.rootViewController = self.split;
    
    
    self.userManager = [[UserManager alloc] init];
    self.userManager.delegate = self;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


-(void)login{

    UIAlertView *alerView = [[UIAlertView alloc] initWithTitle:@"登陆" message:nil delegate:self cancelButtonTitle:@"登陆" otherButtonTitles:@"取消" ,nil];
    
    alerView.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    
    self.rightItem.title = @"退出";
    [self.rightItem setAction:@selector(logout)];
    
    [alerView show];
}

-(void)logout{

    self.rightItem.title = @"登陆";
    [self.rightItem setAction:@selector(login)];
    self.detail.title = @"";

    [self.userManager logout];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

    if (buttonIndex == 0) {
        UITextField *username = [alertView textFieldAtIndex:0];
        UITextField *password = [alertView textFieldAtIndex:1];
        
        [self.userManager login:username.text andPassword:password.text];
        
        NSLog(@"username=%@, password=%@", username.text, password.text);
    }
}
    
-(void)notify:(BOOL)b andUsername:(NSString *) username{


    if (b) {
        NSLog(@"登陆成功");
        self.detail.navigationController.title = username;
        
    }else{
    
        NSLog(@"登陆失败！");
        UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"登陆失败" message:@"用户名或密码错误" delegate:self cancelButtonTitle:nil otherButtonTitles:@"取消", nil];
        
        [al show];
    }
    
}

@end
