//
//  MenuCollectionViewCell.h
//  wireless-order
//
//  Created by turingx on 16/3/1.
//  Copyright © 2016年 turingx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuCollectionViewCell : UICollectionViewCell


@property(nonatomic, strong)UIImageView *pictureImageView;
@property(nonatomic, strong)UILabel *nameLabel;
@property(nonatomic, strong)UILabel *priceLabel;
@property(nonatomic, strong)UILabel *descLabel;

@property(nonatomic, strong)UIButton *datilBtn, *orderBtn;




-(void)prepareViews;


@end
