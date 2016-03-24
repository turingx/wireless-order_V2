//
//  TableView.m
//  wireless-order
//
//  Created by turingx on 16/2/20.
//  Copyright © 2016年 turingx. All rights reserved.
////haha

#import "TableView.h"

@implementation TableView


-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.tableManager = [[TableManager alloc] init];
        self.tableManager.delegate = self;
        
        [self prepareViews];
        
        [self.tableManager queryAllTable];
        
        self.tableList = [NSMutableArray arrayWithCapacity:10];
        
        
        self.backgroundColor = [UIColor redColor];
        
        return self;
    }
    return nil;
    
}

-(void)prepareViews{

    CGRect fream = CGRectMake(0, 0, self.frame.size.width - MAX_WIDTH, self.frame.size.height);
    self.collectionView = [[UICollectionView alloc] initWithFrame:fream collectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
    
    
    [self.collectionView registerClass:[TableCollectionViewCell class] forCellWithReuseIdentifier:@"cid"];
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    self.collectionView.backgroundColor = [UIColor brownColor];
    
    [self addSubview:self.collectionView];
    
}


-(void)notifyAllTables{
    
    self.tableList = self.tableManager.allTableList;
    [self.collectionView reloadData];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.tableList.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    TableCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cid" forIndexPath:indexPath];
    
    Table *t = [self.tableList objectAtIndex:indexPath.row];
    
    if (t.flag == 0) {
        cell.imageView.image = [UIImage imageNamed:@"meiren.png"];
    }else{
         cell.imageView.image = [UIImage imageNamed:@"youren.png"];
    }
    
    cell.numLabel.text = [NSString stringWithFormat:@"%d号桌", t.num];
    
    return cell;
}


-(CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*) collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(230, 140);
}

-(UIEdgeInsets)collectionView: (UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    
    return UIEdgeInsetsMake(20, 20, 20, 20);
    
}


@end
