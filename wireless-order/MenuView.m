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

    
    self.seg = [[UISegmentedControl alloc]initWithItems:@[@"热菜", @"凉菜", @"主食", @"酒水"]];
    self.seg.frame = CGRectMake(100, 50, 400, 30);
    [self addSubview:self.seg];
    
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
    
    
    return cell;
}

@end
