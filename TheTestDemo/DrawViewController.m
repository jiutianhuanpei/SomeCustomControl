//
//  DrawViewController.m
//  TheTestDemo
//
//  Created by 沈红榜 on 15/4/23.
//  Copyright (c) 2015年 沈红榜. All rights reserved.
//

#import "DrawViewController.h"
#import "CNLineChartView.h"
#import "CNChartModel.h"

#import "PieChartView.h"

@interface DrawViewController ()

@end

@implementation DrawViewController {
    
    NSArray *_points;
    UIColor *_lineColor;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    

    [self drawPieView];

    

    
    
}

- (void)drawPieView {
    
    PieChartView *pieView = [[PieChartView alloc] initWithFrame:self.view.bounds];
    pieView.center = self.view.center;
    
    pieView.values = @[@"15", @"20", @"10", @"30", @"25"];
    
    [self.view addSubview:pieView];
}

- (void)drawLineView {
//    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:0];
//    for (int i = 0; i < 10; i++) {
//        CGFloat x = arc4random() % 320;
//        CGFloat y = arc4random() % 640;
//        CGPoint point = CGPointMake(x, y);
//        NSValue *value = [NSValue valueWithCGPoint:point];
//        [array addObject:value];
//    }
//    for (NSValue *value in array) {
//        CGPoint point = CGPointMake(0, 0);
//        [value getValue:&point];
//        NSLog(@"%@", NSStringFromCGPoint(point));
//    }
    
    NSArray *array1 = @[@1, @3, @4, @5, @6];
    NSArray *array2 = @[@9, @6, @6, @0, @9];
    
    CNChartModel *model1 = [[CNChartModel alloc] initWithTitle:@"124" numbers:array1 color:[UIColor redColor]];
    model1.width = @1;
    CNChartModel *model2 = [[CNChartModel alloc] initWithTitle:@"124" numbers:array2 color:[UIColor grayColor]];
    model2.width = @2;
    
    CNLineChartView *drawView = [[CNLineChartView alloc] initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.bounds), 400)];
    drawView.backgroundColor = [UIColor greenColor];
    drawView.xlabels = @[@"1", @"2", @"3", @"4", @"5", @"6"];
    drawView.ylabels = @[@9, @6, @6, @0, @9];
    drawView.charts = @[model1, model2];
    
    [self.view addSubview:drawView];
}




@end
