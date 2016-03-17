//
//  MenuView.m
//  wireless-order
//
//  Created by turingx on 16/2/20.
//  Copyright © 2016年 turingx. All rights reserved.
//

#import "MenuView.h"

static NSString *cid = @"cid";

@implementation MenuView


-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor greenColor];
        [self prepareViews];
        
        self.datasource = [NSMutableArray arrayWithCapacity:10];
        
        self.util = [DBUtil getIntance];
        self.datasource = [self.util queryMenu];
        
        
        [self.collectionView reloadData];
        
        
        self.orderMenuDatasource = [NSMutableArray arrayWithCapacity:10];
                     
        return self;
    }
    return nil;

}


-(CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*) collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(230, 110);
}

-(UIEdgeInsets)collectionView: (UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{

    
    return UIEdgeInsetsMake(10, 10, 10, 10);

}

//haha
-(void)prepareViews{

    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 40, self.frame.size.width - MAX_WIDTH, self.frame.size.height) collectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
    [self.collectionView registerClass:[MenuCollectionViewCell class] forCellWithReuseIdentifier:cid];  //注册单元格
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    [self addSubview:self.collectionView];  //这里使用slef而不使用self.view的原因是Menu本来就是一个视图

    
    self.menuTypeDatasource = [NSMutableArray arrayWithCapacity:10];
    self.menuTypeDatasource = [self.util queryMenuType];
    

   
    NSMutableArray *temp = [NSMutableArray arrayWithCapacity:10];
    [temp removeAllObjects];
    for (MenuType *mt in self.menuTypeDatasource) {
        [temp addObject:mt.name];
    }
    
    
    self.seg = [[UISegmentedControl alloc]initWithItems:@[@"热菜", @"凉菜", @"主食", @"酒水"]];
    self.seg.frame = CGRectMake(70, 50, 400, 30);
    
    [self.seg addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    
    [self addSubview:self.seg];
    
    //实现BBBadgeBarButton方法
    
    UIButton *customButton = [[UIButton alloc] init];

    self.barButton = [[BBBadgeBarButtonItem alloc] initWithCustomUIButton:customButton];

 //   barButton.badgeValue = @"3";
    

    UIToolbar *tb = [[UIToolbar alloc] initWithFrame:CGRectMake(480, 50, 70, 30)];
    tb.items = @[self.barButton];
   // tb.backgroundColor = [UIColor blackColor];
    [self addSubview:tb];
    
}

-(void)change:(UISegmentedControl *)sender{
    
    long index = sender.selectedSegmentIndex;
    MenuType *mt = [self.menuTypeDatasource objectAtIndex:index];
    self.datasource = [self.util queryMenuById:mt.objectId];
    [self.collectionView reloadData];
    

}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.datasource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    MenuCollectionViewCell  *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cid forIndexPath:indexPath];
    
    Menu *m = [self.datasource objectAtIndex:indexPath.row];
    
    NSString *path = [NSString stringWithFormat:@"%@/Documents/%@",NSHomeDirectory(),m.picture_path];
    
    cell.pictureImageView.image = [UIImage imageWithContentsOfFile:path];
    
    cell.nameLabel.text = m.name;
    cell.priceLabel.text = [NSString stringWithFormat:@"%0.2f", m.price];
    cell.descLabel.text = m.desc;
    
    cell.backgroundColor = [UIColor orangeColor];
    
     cell.orderBtn.tag = indexPath.row;
    [cell.orderBtn addTarget:self action:@selector(add:) forControlEvents:UIControlEventTouchUpInside];
   
    
    return cell;
}

-(void)add:(UIButton *)sender{

    NSLog(@"下单...");
    
    OrderMenu *om = [[OrderMenu alloc] init];
    long index = sender.tag;
    
    Menu *m = [self.datasource objectAtIndex:index];
    
    om.mid = m.objectId;
    om.name = m.name;
    om.price = m.price;
    
    
    int value;
    if (self.barButton.badgeValue == nil) {
        value = 0;
    }else{
        
        value = [self.barButton.badgeValue intValue];
    }
    
    self.barButton.badgeValue = [NSString stringWithFormat:@"%d", ++value];
    
    
    
    BOOL flag = false;
    
    for (OrderMenu *om in self.orderMenuDatasource) {
        if ([om.mid isEqualToString:m.objectId]) {
            flag = true;
            break;
        }
    }
    
    if (flag) {
        om.num = om.num + 1;
    }else{
        om.num = 1;
    }
    
    om.total = om.price * om.num;
    if (!flag) {
        [self.orderMenuDatasource addObject:om];
    }

}

@end
