//
//  DrawViewController.m
//  TheTestDemo
//
//  Created by 沈红榜 on 15/4/23.
//  Copyright (c) 2015年 沈红榜. All rights reserved.
//

#import "DrawViewController.h"

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
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = 0; i < 10; i++) {
        CGFloat x = arc4random() % 320;
        CGFloat y = arc4random() % 640;
        CGPoint point = CGPointMake(x, y);
//        [array addObject:point];
    }
    
    
    
}






@end
