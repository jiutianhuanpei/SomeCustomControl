
//
//  CollectionViewCell.m
//  TheTestDemo
//
//  Created by 沈红榜 on 15/4/28.
//  Copyright (c) 2015年 沈红榜. All rights reserved.
//

#import "CanRemoveCell.h"
#import <HexColor.h>

@implementation CanRemoveCell {
    UIImage *_image;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _image = [UIImage imageNamed:@"Oval 8 + Line Copy 5"];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    CGFloat maxWidth = rect.size.width - 4;
    CGFloat maxHeight = rect.size.height - 7;
//    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 7, maxWidth, maxHeight) ];
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 7, maxWidth, maxHeight) cornerRadius:5];
    
    [[UIColor colorWithHexString:@"403f55"] set];
    [path fill];
    
    [_image drawInRect:CGRectMake(rect.size.width - 16, 0, 16, 16)];
    
    CGSize size = [_model.title sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13]}];
    [_model.title drawInRect:CGRectMake(maxWidth / 2. - size.width / 2., maxHeight / 2. - size.height / 2. + 7, size.width, size.height) withAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13], NSForegroundColorAttributeName : [UIColor colorWithHexString:@"FFFFFF"]}];
    
    
}

@end
