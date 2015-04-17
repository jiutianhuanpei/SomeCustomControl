//
//  CustomBtn.h
//  TheTestDemo
//
//  Created by 沈红榜 on 15/4/17.
//  Copyright (c) 2015年 沈红榜. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomBtn : UIControl

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *title;
//@property (nonatomic, strong) NSAttributedString *title;
@property (nonatomic, assign ,readonly) BOOL isSelected;

@end
