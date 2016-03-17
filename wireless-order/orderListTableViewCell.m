//
//  orderListTableViewCell.m
//  wireless-order
//
//  Created by turingx on 16/3/18.
//  Copyright © 2016年 turingx. All rights reserved.
//

#import "orderListTableViewCell.h"

@implementation orderListTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self initViews];
        return self;
    }
    
    return nil;
}

-(void)initViews{

    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.frame = CGRectMake(10, 5, 50, 44);
    [self addSubview:self.nameLabel];

    self.priceLabel = [[UILabel alloc] init];
    self.priceLabel.frame = CGRectMake(80, 5, 50, 44);
    [self addSubview:self.priceLabel];

    self.numLabel = [[UILabel alloc] init];
    self.numLabel.frame = CGRectMake(120, 5, 50, 44);
    [self addSubview:self.numLabel];

    self.totalLabel = [[UILabel alloc] init];
    self.totalLabel.frame = CGRectMake(170, 5, 50, 44);
    [self addSubview:self.totalLabel];

}

@end
