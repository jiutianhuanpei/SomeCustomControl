//
//  HistogramView.m
//  TheTestDemo
//
//  Created by 沈红榜 on 15/4/27.
//  Copyright (c) 2015年 沈红榜. All rights reserved.
//

#import "HistogramView.h"
#import <HexColor.h>

@implementation HistogramView {
    NSArray *_titles;
    NSArray *_values;
    CGFloat _sum;
    CGRect _rect;
    
    CGFloat _maxValue;
    CGFloat _minValue;
    CGFloat _maxHeight;
    CGFloat _maxWidth;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
        _titles = @[@"王小萌", @"孙丽", @"王仁", @"王大白", @"张萌", @"李白", @"周名"];
        _values = @[@"45", @"38", @"32", @"23", @"20", @"9", @"3"];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    _maxWidth = rect.size.width;
    _maxHeight = rect.size.height - 41;
    _rect = rect;
    
    // 画 柱状图
    [self drawHistogram];
    
    //
    [self drawXLabels];
    
    //
    [self drawYLabels];

    
    
}

- (void)drawYLabels {
    NSMutableArray *yLabels = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = 0; i < _maxValue / 10; i++) {
        NSString *count = [NSString stringWithFormat:@"%d", i * 10];
        [yLabels addObject:count];
    }
    
    
    for (int i = 0; i < yLabels.count; i++) {
        if (i == 0) {
            continue;
        }
        NSString *yText = yLabels[i];
        CGFloat value = [self makeValueFit:[yText floatValue]];
        
        CGSize countSize = [yText sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:11]}];
        
        CATextLayer *TextLayer = [CATextLayer layer];
        TextLayer.string = yText;
        TextLayer.fontSize = 11;
        TextLayer.foregroundColor = [UIColor colorWithHexString:@"9d9cc7"].CGColor;
        TextLayer.frame = CGRectMake(16, _maxHeight - value - countSize.height / 2., countSize.width, countSize.height);
        [self.layer addSublayer:TextLayer];
        
        
        CGFloat maxX = 43;
        CGFloat spanL = 2;  // 间隔长度
        CGFloat line = 3;   // 短线长度
        while (maxX < _maxWidth - 16) {
            UIBezierPath *path = [UIBezierPath bezierPath];
            [path moveToPoint:CGPointMake(maxX += spanL, _maxHeight - value)];
            [path addLineToPoint:CGPointMake(maxX += line, _maxHeight - value)];
            [[UIColor colorWithWhite:0.7 alpha:0.4] set];
            path.lineWidth = 0.5;
            [path stroke];
        }

    }

}

- (void)drawXLabels {
    
    for (int i = 0; i < _titles.count; i++) {
        NSString *string = _titles[i];
        CGSize size = [string sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:11]}];
        [string drawInRect:CGRectMake(68 - size.width / 2. + 45 * i, _maxHeight + 10, size.width, size.height) withAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:11], NSForegroundColorAttributeName : [UIColor colorWithHexString:@"9d9cc7"]}];
    }
}


- (void)drawHistogram {
    
    _sum = 0;
    _maxValue = 0;
    
    for (NSString *string in _values) {
        CGFloat value = [string floatValue];
        _sum += value;
        
        if (_maxValue < value) {
            _maxValue = value;
        }
        if (_minValue > value) {
            _minValue = value;
        }
    }
    
    // 底边
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(43, _maxHeight)];
    [path addLineToPoint:CGPointMake(_maxWidth - 16, _maxHeight)];
    [[UIColor colorWithWhite:0.7 alpha:0.4] set];
    path.lineWidth = 1.;
    path.lineCapStyle = kCGLineCapSquare;
    [path stroke];
    
    
    CGFloat width = 20;
    
    for (int i = 0; i < _values.count; i++) {
        CGFloat value = [_values[i] floatValue];
        value = [self makeValueFit:value];
        
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.frame = self.bounds;
        layer.lineCap = kCALineCapButt;
        layer.lineJoin = kCALineJoinMiter;
        if (i < 3) {
            layer.strokeColor = [UIColor colorWithHexString:@"53d765"].CGColor;
        } else {
            layer.strokeColor = [UIColor colorWithHexString:@"ff4845"].CGColor;
        }
        layer.fillColor = [UIColor blueColor].CGColor;
        layer.lineWidth = width;
        layer.strokeEnd = 1;
        
        [self.layer addSublayer:layer];
        
        UIBezierPath *path = [UIBezierPath bezierPath];
        
        [path moveToPoint:CGPointMake(68 + 45 * i, _maxHeight)];
        [path addLineToPoint:CGPointMake(68 + 45 * i, _maxHeight - value)];
        layer.path = path.CGPath;
        

        // 数字
        NSString *count = _values[i];
        CGSize countSize = [count sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:11]}];
        CATextLayer *TextLayer = [CATextLayer layer];
        TextLayer.string = count;
        TextLayer.fontSize = 11;
        if (value > countSize.height) {
            TextLayer.foregroundColor = [UIColor colorWithHexString:@"ffffff"].CGColor;
            TextLayer.frame = CGRectMake(68 - countSize.width / 2. + 45 * i, _maxHeight - value, countSize.width, countSize.height);
        } else {
            TextLayer.foregroundColor = [UIColor colorWithHexString:@"858598"].CGColor;
            TextLayer.frame = CGRectMake(68 - countSize.width / 2. + 45 * i, _maxHeight - value - countSize.height, countSize.width, countSize.height);
        }
        [self.layer addSublayer:TextLayer];
        
        
        // 动画
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        animation.duration = 1;
        animation.fromValue = @0;
        animation.toValue = @1;
        [layer addAnimation:animation forKey:nil];
        
    }
    
    // 画 中线
    CGFloat midValue = [self makeValueFit:(_maxValue / 2)];
    CGFloat maxX = 43;
    CGFloat spanL = 2;  // 间隔长度
    CGFloat line = 3;   // 短线长度
    while (maxX < _maxWidth - 16) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(maxX += spanL, _maxHeight - midValue)];
        [path addLineToPoint:CGPointMake(maxX += line, _maxHeight - midValue)];
        [[UIColor colorWithHexString:@"3cb3fc"] set];
        path.lineWidth = 1.;
        path.lineCapStyle = kCGLineCapSquare;
        [path stroke];
    }
    
    // 画 标识
    NSString *midString = [NSString stringWithFormat:@"平均值%.f", _maxValue / 2.];
    CGSize midSize = [midString sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:11]}];
    [midString drawInRect:CGRectMake(_maxWidth - 13 - midSize.width, 5, midSize.width, midSize.height) withAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:11], NSForegroundColorAttributeName : [UIColor colorWithHexString:@"858598"]}];
    
    CGFloat colorW = 10;    // 色块宽度
    CGFloat colorR = 3;     // 色块圆角
    UIBezierPath *colorBlock = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(_maxWidth - 13 - midSize.width - 5 - colorW, 5 - colorW / 2. + midSize.height / 2., colorW, colorW) cornerRadius:colorR];
    [[UIColor colorWithHexString:@"3cb3fc"] set];
    [colorBlock fill];

}

- (CGFloat)makeValueFit:(CGFloat)aaa {
    
    
    return aaa * ((_maxHeight - 50) / _maxValue);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
