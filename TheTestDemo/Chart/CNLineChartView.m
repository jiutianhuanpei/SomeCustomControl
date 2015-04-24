//
//  CNLineChartView.m
//  CribnV3
//
//  Created by Barthoomew on 4/23/15.
//  Copyright (c) 2015 Barthoomew. All rights reserved.
//

#import "CNLineChartView.h"
#import "CNChartModel.h"

CGFloat const kYTopPadding = 50.f;
CGFloat const kYBottomPadding = 20.f;
CGFloat const kXRightPadding = 30.f;
CGFloat const kXLeftPadding = 20.f;
CGFloat const kTextLayoutHeight = 10.f;
CGFloat const kTextWidth = 50.f;
CGFloat const kTopPaddng = 45.f;

@interface CNLineChartView()

- (void)drawXLabels;
- (void)drawYLabels;
- (void)drawLines;
- (void)drawTitle;

@end

@implementation CNLineChartView{
    NSMutableArray      *_linesLayer;
    NSMutableArray      *_textLayer;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _linesLayer = [NSMutableArray array];
        _textLayer = [NSMutableArray array];
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    [self drawXLabels];
    [self drawYLabels];
    [self drawLines];
}

- (void)drawXLabels{
    CGFloat maxWidth = CGRectGetWidth(self.bounds)-kXRightPadding-kXLeftPadding;
    CGFloat maxHeight = CGRectGetHeight(self.bounds);
    CGFloat span = maxWidth/self.xlabels.count;
    NSInteger i = 0;
    for (NSNumber *number in self.xlabels) {
        CATextLayer *layer = [CATextLayer new];
        layer.string = [NSString stringWithFormat:@"%@",number];
        layer.fontSize = kTextLayoutHeight;
        layer.foregroundColor = [UIColor grayColor].CGColor;
        layer.alignmentMode = kCAAlignmentCenter;
        layer.contentsScale = [UIScreen mainScreen].scale;
        layer.frame = CGRectMake(kXLeftPadding+span*(i+1)-kTextWidth/2, maxHeight-kYBottomPadding-kTextLayoutHeight, kTextWidth, kTextLayoutHeight);
        [_textLayer addObject:layer];
        [self.layer addSublayer:layer];
        i++;
    }
}

- (void)drawYLabels{
    CGFloat totalheight = CGRectGetHeight(self.bounds);
    CGFloat maxHeight = totalheight-kYTopPadding-kYBottomPadding;
    CGFloat span = maxHeight/self.ylabels.count;
    NSInteger i = 0;
    for (NSNumber *number in self.ylabels) {
        CATextLayer *layer = [CATextLayer new];
        layer.string = [NSString stringWithFormat:@"%@",number];
        layer.fontSize = kTextLayoutHeight;
        layer.foregroundColor = [UIColor grayColor].CGColor;
        layer.alignmentMode = kCAAlignmentCenter;
        layer.contentsScale = [UIScreen mainScreen].scale;
        layer.frame = CGRectMake(kXLeftPadding-kTextWidth/2, totalheight-kYBottomPadding-(i+1)*span-kTextLayoutHeight/2, kTextWidth, kTextLayoutHeight);
        [_textLayer addObject:layer];
        [self.layer addSublayer:layer];
        i++;
    }
}

- (void)drawLines{
    NSMutableArray *maxYs = [NSMutableArray array];
    
    for (CNChartModel *data in self.charts) {
        [maxYs addObject:[data.numbers valueForKeyPath:@"@max.intValue"]];
    }
    
    CGFloat maxY = [[maxYs valueForKeyPath:@"@max.intValue"] intValue];
    CGFloat maxWidth = CGRectGetWidth(self.bounds)-kXRightPadding-kXLeftPadding;
    
    CGFloat totalheight = CGRectGetHeight(self.bounds);
    CGFloat maxHeight = totalheight-kYTopPadding-kYBottomPadding-kTextLayoutHeight;
    
    CGFloat perpix = maxHeight / maxY;
    
    for (CNChartModel *data in self.charts) {
        
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.frame         = self.bounds;
        
        layer.lineCap       = kCALineCapButt;
        layer.lineJoin      = kCALineJoinMiter;
        layer.strokeColor   = [(UIColor*)data.color CGColor];
        layer.fillColor     = [[UIColor clearColor] CGColor];
        layer.lineWidth     = data.width.floatValue;
        layer.strokeEnd     = 1.f;
        
        [_linesLayer addObject:layer];
        [self.layer addSublayer:layer];
        
        UIBezierPath *path = [UIBezierPath bezierPath];
        CGFloat perpwidth = maxWidth/data.numbers.count;
        NSInteger i = 0;
        for (NSNumber *number in data.numbers) {
            if (i==0) {
                [path moveToPoint:CGPointMake(kTextWidth+kXLeftPadding+i*perpwidth, totalheight-kYTopPadding-number.floatValue*perpix)];
            }else{
                [path addLineToPoint:CGPointMake(kTextWidth+kXLeftPadding+i*perpwidth, totalheight-kYTopPadding-number.floatValue*perpix)];
            }
            i++;
        }
        layer.path = path.CGPath;
        
        CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        pathAnimation.duration = 1.0;
        pathAnimation.fromValue = [NSNumber numberWithFloat:0.f];
        pathAnimation.toValue = [NSNumber numberWithFloat:1.f];
        [layer addAnimation:pathAnimation forKey:nil];
    }
}

- (void)drawTitle{
    
}

@end
