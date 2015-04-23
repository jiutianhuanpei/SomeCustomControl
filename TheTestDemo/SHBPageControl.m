//
//  SHBPageControl.m
//  TheTestDemo
//
//  Created by 沈红榜 on 15/4/22.
//  Copyright (c) 2015年 沈红榜. All rights reserved.
//

#import "SHBPageControl.h"

@implementation SHBPageControl {
    UIImage *_activeImg;
    UIImage *_inactiveImg;

}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _activeImg = [UIImage imageNamed:@"account-circle-normal"];
        _inactiveImg = [UIImage imageNamed:@"weixin"];
        _currentPage = 0;
    }
    return self;
}

+ (SHBPageControl *)pageControlWithFrame:(CGRect)frame pageCount:(NSInteger)pageCount {
    SHBPageControl *pageControl = [[SHBPageControl alloc] initWithFrame:frame];
    
    frame = CGRectMake(frame.origin.x, frame.origin.y, 20 * (pageCount - 1) + 10 * pageCount, 10);
    pageControl.frame = frame;
    pageControl.pageCount = pageCount;
    return pageControl;
}


- (void)drawRect:(CGRect)rect
{
    
    CGFloat space = 20;
    CGFloat pointW = 10;
    
    [[UIColor whiteColor] set];
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRect:rect];
    
    [bezierPath fill];
    
    for (int i = 0; i < _pageCount; i++) {
        UIImage *image = [[UIImage alloc] init];
        if (i == _currentPage) {
            image = _activeImg;
        } else {
            image = _inactiveImg;
        }
        
        [image drawInRect:CGRectMake((space + pointW) * i, 0, pointW, pointW)];
    }
    self.bounds = CGRectMake(0, 0, space * (_pageCount - 1) + pointW * _pageCount, pointW);
}

- (void)setCurrentPage:(NSInteger)currentPage {
    _currentPage = currentPage;
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
