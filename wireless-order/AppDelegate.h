//
//  AppDelegate.h
//  wireless-order
//
//  Created by turingx on 16/2/20.
//  Copyright © 2016年 turingx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MasterViewController.h"
#import "DetailViewController.h"
#import "constant.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property(nonatomic, strong)UISplitViewController *split;
@property(nonatomic, strong)MasterViewController *master;
@property(nonatomic,strong)DetailViewController *detail;


@property (strong, nonatomic) UIWindow *window;



@end

