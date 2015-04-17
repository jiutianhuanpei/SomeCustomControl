//
//  CustomBtn.m
//  TheTestDemo
//
//  Created by 沈红榜 on 15/4/17.
//  Copyright (c) 2015年 沈红榜. All rights reserved.
//

#import "CustomBtn.h"

@implementation CustomBtn{
    UITapGestureRecognizer  *_tap;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [self addGestureRecognizer:_tap];
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    [[UIColor whiteColor] set];
    UIBezierPath *rectpath = [UIBezierPath bezierPathWithRect:rect];
    [rectpath fill];
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:rect.size.width/2];
    
    CGRect titleRect = [_title boundingRectWithSize:CGSizeMake(0, rect.size.height / 4) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12]} context:nil];
    CGRect tRect = CGRectMake(rect.size.width / 2 - titleRect.size.width / 2, rect.size.height / 2, titleRect.size.width, rect.size.height / 4);
    
//    [_image drawAsPatternInRect:CGRectMake(20, 20, 15, 15)];
    
    if (_isSelected) {
        [[UIColor colorWithWhite:0.820 alpha:1.000] set];
        
        [bezierPath fill];
        [_title drawInRect:tRect withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.f],NSForegroundColorAttributeName:[UIColor redColor]}];
        self.layer.borderWidth = 1;
        self.layer.cornerRadius = rect.size.width / 2;
        self.layer.masksToBounds = YES;
    }else{
        [[UIColor redColor] set];
        [bezierPath fill];
        [_title drawInRect:tRect withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.f],NSForegroundColorAttributeName:[UIColor whiteColor]}];
        self.layer.borderWidth = 0;
    }
    
    [_image drawInRect:CGRectMake(20, 20, 15, 15)];
}

- (void)tap:(UITapGestureRecognizer*)tap{
    _isSelected = !_isSelected;
    [self setNeedsDisplay];
    [self sendActionsForControlEvents:UIControlEventTouchUpInside];
}

- (void)setTitle:(NSString *)title{
    _title = title;
    [self setNeedsDisplay];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
