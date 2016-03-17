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


@end
