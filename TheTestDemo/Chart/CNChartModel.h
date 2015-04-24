//
//  CNChartModel.h
//  CribnV3
//
//  Created by Barthoomew on 4/23/15.
//  Copyright (c) 2015 Barthoomew. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CNChartModel : NSObject

/**
 *  标题
 */
@property (nonatomic,copy)  NSString        *title;
/**
 *  点数组（为纵向）
 */
@property (nonatomic)       NSArray         *numbers;
/**
 *  颜色
 */
@property (nonatomic,copy)  id              color;
@property (nonatomic)       NSNumber        *width;

- (instancetype)initWithTitle:(NSString*)title numbers:(NSArray *)numbers color:(id)color;

@end
