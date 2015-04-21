//
//  CustomView.h
//  TheTestDemo
//
//  Created by 沈红榜 on 15/4/20.
//  Copyright (c) 2015年 沈红榜. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomView : UIView

@property (nonatomic, strong) UIImage *hospitalPhoto;
@property (nonatomic, strong) NSString *hospitalName;
@property (nonatomic, assign) NSInteger starCount;
@property (nonatomic, strong) NSString *context;
@property (nonatomic, assign) NSInteger tagsCount;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSString *distance;


@end
