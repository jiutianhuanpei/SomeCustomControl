//
//  CustomView.m
//  TheTestDemo
//
//  Created by 沈红榜 on 15/4/20.
//  Copyright (c) 2015年 沈红榜. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (instancetype)initWithFrame:(CGRect)frame
{
    frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width * 190 / 359);
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGFloat space = 8;
    CGFloat maxWidth = rect.size.width - 16;
    [[UIColor whiteColor] set];
    
    
    UIImage *blackImg = [UIImage imageNamed:@"yiyuankapian"];
    [blackImg drawInRect:CGRectMake(space, 0, maxWidth, maxWidth * 190 / 359)];
    
    _hospitalPhoto = [UIImage imageNamed:@"1"];
    [_hospitalPhoto drawInRect:CGRectMake(20, 20, 36, 36)];
    
    
    
    
    
    
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
