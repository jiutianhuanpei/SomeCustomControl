//
//  RootViewController.m
//  TheTestDemo
//
//  Created by 沈红榜 on 15/4/17.
//  Copyright (c) 2015年 沈红榜. All rights reserved.
//

#import "RootViewController.h"
#import "CustomBtn.h"
#import "SHBPageControl.h"
#import "TableViewCell.h"
#import "ToolbarViewController.h"

@interface RootViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation RootViewController {
    
    CustomBtn *_button;
    SHBPageControl *_pageControl;
    
    UITableView *_tableView;
    
    TableViewCell *_cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 添加自定义的 Button
    [self addCustomButton];
    
    // 自定义 pageControl
//    [self customPageControl];
//    [_pageControl setNeedsDisplay];
    
    
    // 添加 tableView
//    [self creatTableView];
    
    // 添加 toolbarVC
    
    
}

- (void)creatTableView {
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_tableView];
    
    
    [_tableView registerClass:[TableViewCell class] forCellReuseIdentifier:NSStringFromClass([TableViewCell class])];
    _cell = [_tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TableViewCell class])];
    
}

#pragma UITableView
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    _cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TableViewCell class]) forIndexPath:indexPath];
    [_cell getSize];
                             
    return _cell;
}

- (void)customPageControl {
    _pageControl = [SHBPageControl pageControlWithFrame:CGRectMake(0, 0, 100, 5) pageCount:3];
    _pageControl.center = self.view.center;
    _pageControl.backgroundColor = [UIColor redColor];
    [self.view addSubview:_pageControl];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"点击" forState:UIControlStateNormal];
    btn.frame = CGRectMake(150, 200, 100, 40);
    btn.backgroundColor = [UIColor grayColor];
    [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view  addSubview:btn];
}

- (void)pushToToolbarViewController:(id)sender {
    ToolbarViewController *toolbarVC = [[ToolbarViewController alloc] init];
    [self.navigationController pushViewController:toolbarVC animated:YES];
}

- (void)clickBtn {
    
    if (arc4random() % 2) {
        _pageControl.currentPage++;

    } else {
        _pageControl.currentPage--;
    }
//    [_pageControl setNeedsDisplay];
    if (_pageControl.currentPage == _pageControl.pageCount) {
        _pageControl.currentPage = 0;
    }
    if (_pageControl.currentPage == -1) {
        _pageControl.currentPage = _pageControl.pageCount - 1;
    }
}

- (void)addCustomButton {
    _button = [[CustomBtn alloc] initWithFrame:CGRectMake(100, 100, 60, 60)];
    
    _button.title = @"如果";
    _button.image = [UIImage imageNamed:@"account-circle-active"];
//    [_button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [_button addTarget:self action:@selector(pushToToolbarViewController:) forControlEvents:UIControlEventTouchUpInside];
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
