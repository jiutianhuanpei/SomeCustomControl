//
//  ToolbarViewController.m
//  TheTestDemo
//
//  Created by 沈红榜 on 15/4/23.
//  Copyright (c) 2015年 沈红榜. All rights reserved.
//

#import "ToolbarViewController.h"

@interface ToolbarViewController ()

@end

@implementation ToolbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"GoBack" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:btn];
    
    
//    self.toolbarItems = @[
//                          [[UIBarButtonItem alloc] initWithTitle:@"图片" style:UIBarButtonItemStylePlain target:self action:@selector(pickUpMultiMedia:)],
//                          [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
//                          [[UIBarButtonItem alloc] initWithTitle:@"拍照" style:UIBarButtonItemStylePlain target:self action:@selector(pickUpMultiMedia:)],
//                          [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
//                          [[UIBarButtonItem alloc] initWithTitle:@"视频" style:UIBarButtonItemStylePlain target:self action:@selector(pickUpMultiMedia:)],
//                          [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
//                          [[UIBarButtonItem alloc] initWithTitle:@"语音" style:UIBarButtonItemStylePlain target:self action:@selector(pickUpMultiMedia:)]
//                          ];
    
    [self creatToolBar];
}


- (void)creatToolBar {
    UIBarButtonItem *requestItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"account-circle-active"] style:UIBarButtonItemStylePlain target:self action:@selector(requestTeacher)];
    UIBarButtonItem *addFriend = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"dingyue"] style:UIBarButtonItemStylePlain target:self action:@selector(addFridend)];
    UIBarButtonItem *sendMessage = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"explore-normal"] style:UIBarButtonItemStylePlain target:self action:@selector(sendMessage)];
    self.toolbarItems = @[requestItem, addFriend, sendMessage];
}

- (void)pickUpMultiMedia:(id)sender {
    
}

- (void)requestTeacher {
    
}

- (void)addFridend {
    
}

- (void)sendMessage {
    
}



- (void)goBack {
//    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setToolbarHidden:true animated:true];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.navigationController setToolbarHidden:false animated:true];
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
