//
//  CustomTableViewCell.m
//  TheTestDemo
//
//  Created by 沈红榜 on 15/4/20.
//  Copyright (c) 2015年 沈红榜. All rights reserved.
//

#import "CustomTableViewCell.h"
#import "CustomView.h"

@implementation CustomTableViewCell {
    CustomView *_cardView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _cardView = [[CustomView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        [self.contentView addSubview:_cardView];
        
        
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
