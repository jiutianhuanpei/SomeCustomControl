//
//  CanNotEditCell.m
//  TheTestDemo
//
//  Created by 沈红榜 on 15/4/28.
//  Copyright (c) 2015年 沈红榜. All rights reserved.
//

#import "CanNotEditCell.h"
#import <HexColor.h>

@implementation CanNotEditCell {

}


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    CGFloat maxWidth = rect.size.width - 4;
    CGFloat maxHeight = rect.size.height - 7;

    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 7, maxWidth, maxHeight) cornerRadius:5];
    if (_model.isSelected) {
        [[UIColor colorWithHexString:@"eaeaf0"] set];
        [path fill];
    } else {
        [[UIColor whiteColor] set];
        [path fill];
        [[UIColor colorWithHexString:@"ededf2"] set];
        [path stroke];
    }
    
    
    
    CGSize size = [_model.title sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13]}];
    [_model.title drawInRect:CGRectMake(maxWidth / 2. - size.width / 2., maxHeight / 2. - size.height / 2. + 7, size.width, size.height) withAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13], NSForegroundColorAttributeName : [UIColor colorWithHexString:@"8c91a6"]}];

    
}


@end
