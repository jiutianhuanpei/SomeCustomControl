//
//  CNChartModel.m
//  CribnV3
//
//  Created by Barthoomew on 4/23/15.
//  Copyright (c) 2015 Barthoomew. All rights reserved.
//

#import "CNChartModel.h"

@implementation CNChartModel

- (instancetype)initWithTitle:(NSString*)title numbers:(NSArray *)numbers color:(id)color{
    self = [super init];
    if (self) {
        _title = title;
        _numbers = numbers;
        _color = color;
    }
    return self;
}


@end
