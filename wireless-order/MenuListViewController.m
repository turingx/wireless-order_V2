//
//  MenuListViewController.m
//  wireless-order
//
//  Created by turingx on 16/3/17.
//  Copyright © 2016年 turingx. All rights reserved.
//

#import "MenuListViewController.h"

@implementation MenuListViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor purpleColor];
   
    
    self.tv = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 100)];
    [self.tv registerClass:[orderListTableViewCell class] forCellReuseIdentifier:@"cid"];
    
    self.tv.dataSource = self;
    self.tv.delegate = self;
    [self.view addSubview:self.tv];
    
    self.pickerView = [[UIPickerView alloc] init];
    self.pickerView.frame = CGRectMake(0, self.view.frame.size.height - 80, 200, 100);
    self.pickerView.delegate  = self;
    self.pickerView.dataSource = self;
    [self.view addSubview:self.pickerView];
    
    self.tableManager = [[TableManager alloc] init];
    self.tableManager.delegate = self;
    [self.tableManager queryEmptyTable];
    
    self.tableList = [NSMutableArray arrayWithCapacity:10];
    
    
    self.orderBtn = [[UIButton alloc] init];
    self.orderBtn.frame = CGRectMake(450, self.view.frame.size.height - 80, 100, 40)
    ;
    [self.orderBtn setTitle:@"下单" forState:UIControlStateNormal];
    
    [self.orderBtn addTarget:self action:@selector(order:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.orderBtn];
    
    
    self.orderManager = [[OrderManager alloc] init];
    self.userManager = [[UserManager alloc] init];
    self.currentTable = [[Table alloc] init];
    
    self.orderManager.delegate = self;
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.orderDataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    orderListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cid"];
    if (cell == nil) {
        cell = [[orderListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cid"];
    }

    OrderMenu *om = [self.orderDataSource objectAtIndex:indexPath.row];
    
    cell.nameLabel.text = om.name;
    cell.priceLabel.text = [NSString stringWithFormat:@"%.f", om.price];
    cell.numLabel.text = [NSString stringWithFormat:@"%d", om.num];
    cell.totalLabel.text = [NSString stringWithFormat:@"%.f", om.total];
    
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{

    return 1;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.tableList.count;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view{

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 40)];
    
    Table *t = [self.tableList objectAtIndex:row];
    label.text = [NSString stringWithFormat:@"%d", t.num];
    
    return label;
}

-(void)notifyEmptyTables{

    self.tableList = self.tableManager.emptyTableList;
    [self.pickerView reloadAllComponents];
    
}

-(void)order:(UIButton *)sender{

    Order *o = [[Order alloc] init];
    User *u =[self.userManager getUser];
    
    if (u == nil) {
        NSLog(@"请登陆！");
        return;
    }
    o.uid = u.objectId;
    if (self.currentTable.objectId == nil) {
        NSLog(@"请选择桌号");
        return;
    }
    o.tid = self.currentTable.objectId;
    o.isPay = 0;
    o.desc = @"woowwoow";
    
    [self.orderManager addOrder:o];
    

}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{

    self.currentTable = [self.tableList objectAtIndex:row];
}

-(void)notify:(NSString *) oid{

    for (OrderMenu *om in self.orderDataSource) {
        OrderDetail *od = [[OrderMenu alloc] init];
        od.oid = oid;
        od.mid = om.mid;
        od.num = om.num;
        od.desc = @"haochi";
        
        [self.orderManager addOrderDetail:od];
    }
    
}

@end
