//
//  PieChartView.m
//  TheTestDemo
//
//  Created by 沈红榜 on 15/4/24.
//  Copyright (c) 2015年 沈红榜. All rights reserved.
//

#import "PieChartView.h"
#import <HexColor.h>

#define ToRadian(radian)            (radian*(M_PI/180.0))

@implementation PieChartView {
    NSArray *_titles;
    
    NSArray *_colors;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        _titles = @[@"患者", @"潜在患者", @"朋友", @"导师", @"学生"];
        _colors = @[
                    [UIColor colorWithHexString:@"9940ea"],
                    [UIColor colorWithHexString:@"ffd800"],
                    [UIColor colorWithHexString:@"3cb3fc"],
                    [UIColor colorWithHexString:@"53d765"],
                    [UIColor colorWithHexString:@"ff4845"]
                    ];
//        _colors = @[
//                    [UIColor redColor],
//                    [UIColor yellowColor],
//                    [UIColor purpleColor],
//                    [UIColor grayColor],
//                    [UIColor yellowColor]
//                    ];
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGFloat centerX = 160;
    CGFloat centerY = 300;
    CGFloat radius = 74;
    
    // 抗锯齿
    CGContextSetAllowsAntialiasing(context, YES);
    
    CGFloat sum = 0;
    for (int i = 0; i < _values.count; i++) {
         sum += [_values[i] floatValue];
        
    }
    
    NSLog(@"%f", ToRadian(0));
    NSLog(@"%f", ToRadian(90));
    NSLog(@"%f", ToRadian(180));
    NSLog(@"%f", ToRadian(360));
    
//    CGContextMoveToPoint(context, centerX, centerY);
    
    CGFloat currentangel = 0;
    
    //饼图
    CGContextSaveGState(context);
    CGContextScaleCTM(context, 1, 1);
    

    
    for (int i = 0; i < _values.count; i++) {
        CGFloat span = [_values[i] floatValue] / sum * 360;
        
        
        CGFloat starAngle = ToRadian(currentangel);
        currentangel += span;
        CGFloat endAngle = ToRadian(currentangel);
        
        // 绘制扇形
        CGContextMoveToPoint(context, centerX, centerY);
//        [_colors[i % _values.count] setFill];
        [_colors[i] setFill];
        [[UIColor purpleColor] setStroke];
        CGContextAddArc(context, centerX, centerY, radius, starAngle, endAngle, 0);
//        NSLog(@"%f", M_PI);
        CGContextClosePath(context);
        CGContextDrawPath(context, kCGPathFill);
        
    }
    
    // 画圆心
    CGContextSaveGState(context);
    CGContextScaleCTM(context, 1, 1);
    CGContextMoveToPoint(context, centerX, centerY);
    [[UIColor whiteColor] setFill];
    CGContextAddArc(context, centerX, centerY, radius - 36, 0, 10, 0);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFill);
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
