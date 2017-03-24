//
//  MFCollectionViewCell.m
//  MFCollectionAnimation
//
//  Created by htkg on 17/3/24.
//  Copyright © 2017年 MF. All rights reserved.
//

#import "MFCollectionViewCell.h"

@implementation MFCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = YES;
    // Initialization code
}

@end
