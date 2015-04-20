//
//  RootViewController.m
//  TheTestDemo
//
//  Created by 沈红榜 on 15/4/17.
//  Copyright (c) 2015年 沈红榜. All rights reserved.
//

#import "RootViewController.h"
#import "CustomBtn.h"

@interface RootViewController ()

@end

@implementation RootViewController {
    
    CustomBtn *_button;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 添加自定义的 Button
    [self addCustomButton];
    

    

    
}

- (void)addCustomButton {
    _button = [[CustomBtn alloc] initWithFrame:CGRectMake(100, 100, 60, 60)];
    _button.title = @"如果";
    _button.image = [UIImage imageNamed:@"account-circle-active"];
    [_button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
}

- (void)click:(id)sender{
    NSLog(@"jhello world");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
