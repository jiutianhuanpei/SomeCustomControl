//
//  CNChartView.h
//  CribnV3
//
//  Created by Barthoomew on 4/23/15.
//  Copyright (c) 2015 Barthoomew. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CNChartView : UIView

@property (nonatomic,copy)      NSArray             *xlabels;
@property (nonatomic,copy)      NSArray             *ylabels;

@property (nonatomic)           NSInteger           numberOfXlabels;
@property (nonatomic)           NSInteger           numberOfYlabels;


/**
 *  CNChartModel 数组
 */
@property (nonatomic,copy)      NSArray             *charts;

@end
