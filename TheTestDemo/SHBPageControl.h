//
//  SHBPageControl.h
//  TheTestDemo
//
//  Created by 沈红榜 on 15/4/22.
//  Copyright (c) 2015年 沈红榜. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHBPageControl : UIControl

@property (nonatomic, assign) NSInteger pageCount;
@property (nonatomic, assign) NSInteger currentPage;

+ (SHBPageControl *)pageControlWithFrame:(CGRect)frame pageCount:(NSInteger)pageCount;

@end
