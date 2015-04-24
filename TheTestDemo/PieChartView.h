//
//  PieChartView.h
//  TheTestDemo
//
//  Created by 沈红榜 on 15/4/24.
//  Copyright (c) 2015年 沈红榜. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PieChartView : UIView

/**
 *  顺序: 患者-潜在患者-朋友-导师-学生
 */
@property (nonatomic, strong) NSArray *values;

@end
