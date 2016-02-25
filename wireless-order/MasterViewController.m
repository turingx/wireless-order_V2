//
//  MasterViewController.m
//  wireless-order
//
//  Created by turingx on 16/2/20.
//  Copyright © 2016年 turingx. All rights reserved.
//

#import "MasterViewController.h"
#import "constant.h"


@interface MasterViewController ()

@end



@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    self.tv = [[UITableView alloc] init];
    self.tv.frame = CGRectMake(0, 5, MAX_WIDTH, self.view.frame.size.height);
    //MAX_WIDTH引用自constant.h
    self.tv.delegate = self;
    self.tv.dataSource =self;
    [self.view addSubview:self.tv];

    
    [self initDatasource];  //调用数据源
    
    [self initViews]; //调用主视图菜单栏目跳转视图方法
    
    self.menuManager = [[MenuManager alloc] init]; //初始化分类管理（同步数据方法类）
    
    [self.menuManager syncMenu];   //调用同步数据方法获取菜单数据
    [self.menuManager syncMenuType];  //调用同步数据的方法获取菜单分类数据
    
    
    
    // Do any additional setup after loading the view.
}


-(void)initDatasource{    //初始化数据源设置主视图左侧的菜单选项名称
    
    self.datasource = [NSMutableArray arrayWithCapacity:5];
    [self.datasource addObject:@"浏览菜单"];
    [self.datasource addObject:@"查看餐台"];
    [self.datasource addObject:@"买单结算"];
    [self.datasource addObject:@"同步数据"];
    [self.datasource addObject:@"系统设置"];
    
}

-(void)initViews{   //初始化主视图菜单栏目跳转视图
    
    self.menuView = [[MenuView alloc] initWithFrame:self.view.frame];
    self.tableView = [[TableView alloc] initWithFrame:self.view.frame];
    self.payView = [[PayView alloc] initWithFrame:self.view.frame];
    self.syncDataView = [[SyncDataView alloc] initWithFrame:self.view.frame];
    self.settingView = [[SettingView alloc] initWithFrame:self.view.frame];


}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{   //选择某行的cell就切换到对应的视图
    
    switch (indexPath.row) {
        case 0:
            self.detail.view = self.menuView;
            NSLog(@"浏览菜单");
            break;
        case 1:
            self.detail.view = self.tableView;
            NSLog(@"查看餐台");
            break;
        case 2:
            self.detail.view = self.payView;
            NSLog(@"买单结算");
            break;
        case 3:
            self.detail.view = self.syncDataView;
            NSLog(@"同步数据");
            break;
        case 4:
            self.detail.view = self.settingView;
            NSLog(@"系统设置");
            break;
            
        default:
            break;
    }

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.datasource.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cid"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cid"];
        NSString *Item = [self.datasource objectAtIndex:indexPath.row];
        cell.textLabel.text = Item;  //将标题名称赋值给cell
    }
    
    return cell;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
