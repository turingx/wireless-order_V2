//
//  TableCollectionViewCell.m
//  wireless-order
//
//  Created by turingx on 16/3/23.
//  Copyright © 2016年 turingx. All rights reserved.
//

#import "TableCollectionViewCell.h"

@implementation TableCollectionViewCell


-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if(self){
        
        [self prepareViews];
    
        return self;
    }
    
    return nil;
}

-(void)prepareViews{

    self.imageView = [[UIImageView alloc] init];
    self.imageView.frame = CGRectMake(101, 10, 10, 10);
    self.numLabel = [[UILabel alloc] init];
    self.numLabel.frame = CGRectMake(10, 10, 10, 10);
    
    [self.contentView addSubview:self.numLabel];
    [self.contentView addSubview:self.imageView];
}

@end
