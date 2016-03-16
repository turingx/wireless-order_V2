//
//  MenuCollectionViewCell.m
//  wireless-order
//
//  Created by turingx on 16/3/1.
//  Copyright © 2016年 turingx. All rights reserved.
//

#import "MenuCollectionViewCell.h"

@implementation MenuCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        
        [self prepareViews];
        return self;
    }

    return nil;
}

//haha
-(void)prepareViews{
    
    self.pictureImageView = [[UIImageView alloc] init];
    self.pictureImageView.frame = CGRectMake(0, 18, 100, 75);
    [self.contentView addSubview:self.pictureImageView];
    
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.frame = CGRectMake(140, 0, 120, 20);
    [self.contentView addSubview:self.nameLabel];
    
    
    self.priceLabel = [[UILabel alloc] init];
    self.priceLabel.frame = CGRectMake(140, 20, 120, 20);
    [self.contentView addSubview:self.priceLabel];
    
//    self.descLabel = [[UILabel alloc] init];
//    self.descLabel.frame = CGRectMake(10, 10, 10, 10);
//    [self.contentView addSubview:self.descLabel];
    
   // self.contentView.backgroundColor = [UIColor whiteColor];
    
    //设置datilBtn和orderBtn
    
    self.datilBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [self.datilBtn setTitle:@"详情" forState:UIControlStateNormal];
    self.datilBtn.frame = CGRectMake(120, 40, 40, 40);
    self.datilBtn.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.datilBtn];
    
    
    self.orderBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [self.orderBtn setTitle:@"下单" forState:UIControlStateNormal];
    self.orderBtn.frame = CGRectMake(170, 40, 40, 40);
    self.backgroundColor = [UIColor redColor];
    self.orderBtn.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.orderBtn];
    
    
                    
    

}



@end
