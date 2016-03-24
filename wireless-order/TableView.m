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
        [self.tableManager queryAllTable];
        
        self.backgroundColor = [UIColor redColor];
        NSLog(@"hello world!");
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
    
    [self addSubview:self.collectionView];
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return 10;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    return nil;
}


@end
