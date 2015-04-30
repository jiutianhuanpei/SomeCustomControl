//
//  CollViewController.m
//  TheTestDemo
//
//  Created by 沈红榜 on 15/4/28.
//  Copyright (c) 2015年 沈红榜. All rights reserved.
//

#import "CollViewController.h"
#import "CanRemoveCell.h"
#import <HexColor.h>
#import "CanNotEditCell.h"
#import "CollectionView.h"

@interface CollViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@end
typedef enum : NSUInteger {
    up,
    down,
    
} UpOrDown;

@implementation CollViewController {
    UICollectionView *_selectedView;
    NSMutableArray *_dataArray;
    NSMutableArray *_downArray;
    
    NSMutableArray *_tempArray;
    
    UICollectionView *_editView;
    
    CollectionView *_topView;
    CollectionView *_bottomView;
    
    BOOL _up;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    self.navigationItem.title = @"订阅标签";
    self.automaticallyAdjustsScrollViewInsets = NO;
    _dataArray = [[NSMutableArray alloc] initWithCapacity:0];
    _tempArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    for (int i = 0; i < 10; i++) {
        TagModel *model = [[TagModel alloc] init];
        model.title = [NSString stringWithFormat:@"%d", i * 10];
        if (i < 2) {
            model.isSelected = YES;
        } else {
            model.isSelected = NO;
        }
        [_dataArray addObject:model];
        [_tempArray addObject:model];
 
    }

    
    [self topView];

//    [self bottomView];
    
    
    
}




#pragma mark - UICollectionViewDataSource
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    TagModel *model = _dataArray[indexPath.row];
//    
//    if (collectionView.tag == 100) {
//        if (model.isSelected) {
//            CanNotEditCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CanNotEditCell class]) forIndexPath:indexPath];
//            cell.model = model;
//            return cell;
//        } else {
//            CanRemoveCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CanRemoveCell class]) forIndexPath: indexPath];
//            cell.model = model;
//            return cell;
//        }
//    } else {
//        CanNotEditCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CanNotEditCell class]) forIndexPath:indexPath];
//        cell.model = model;
//        return cell;
//    }
    if (indexPath.section == 0) {
        TagModel *model = _dataArray[indexPath.row];
        CanRemoveCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CanRemoveCell class]) forIndexPath: indexPath];
        cell.model = model;
        return cell;
    } else {
        TagModel *model = _tempArray[indexPath.row];
        CanRemoveCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CanRemoveCell class]) forIndexPath: indexPath];
        cell.model = model;
        return cell;
    }
    
    
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if (section == 0) {
        return _dataArray.count;
    }else {
        return _tempArray.count;
    }
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 1) {
        [_dataArray addObject:_tempArray[indexPath.row]];
        [_tempArray removeObjectAtIndex:indexPath.row];
        
        [collectionView moveItemAtIndexPath:indexPath toIndexPath:[NSIndexPath indexPathForRow:_dataArray.count-1 inSection:0]];
        
    } else if (indexPath.section == 0) {
        [_tempArray addObject:_dataArray[indexPath.row]];
        [_dataArray removeObjectAtIndex:indexPath.row];
        [collectionView moveItemAtIndexPath:indexPath toIndexPath:[NSIndexPath indexPathForRow:_tempArray.count - 1 inSection:1]];
    }
    
 
    

}


- (void)bottomView {
    
    CGFloat maxWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat maxHeight = [UIScreen mainScreen].bounds.size.height;
    
    CollectionView *view = [[CollectionView alloc] initWithFrame:CGRectMake(0, 242 + 64, maxWidth, maxHeight - 242 - 64 - 49) collectionViewLayout:nil];
    view.tag = 200;
    //    _topView = [[CollectionView alloc] initWithFrame:CGRectMake(0, 242, maxWidth, maxHeight - 242 - 64 - 49) collectionViewLayout:nil];
    view.backgroundColor = [UIColor whiteColor];
    view.delegate = self;
    view.dataSource = self;
    view.witchTag = editTag;
    [self.view addSubview:view];
    [view registerClass:[CanRemoveCell class] forCellWithReuseIdentifier:NSStringFromClass([CanRemoveCell class])];
    [view registerClass:[CanNotEditCell class] forCellWithReuseIdentifier:NSStringFromClass([CanNotEditCell class])];
}

- (void)topView {
    
    CGFloat maxWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat maxHeight = [UIScreen mainScreen].bounds.size.height;
//    CollectionView *view = [[CollectionView alloc] initWithFrame:CGRectMake(0, 64, maxWidth, 242) collectionViewLayout:nil];
    CollectionView *view = [[CollectionView alloc] initWithFrame:CGRectMake(0, 64, maxWidth, maxHeight - 64 - 49) collectionViewLayout:nil];
    view.tag = 100;
    //    _topView = [[CollectionView alloc] initWithFrame:CGRectMake(0, 0, maxWidth, 242) collectionViewLayout:nil];
    view.backgroundColor = [UIColor whiteColor];
    view.delegate = self;
    view.dataSource = self;
    view.witchTag = selectedTag;
    [self.view addSubview:view];
    [view registerClass:[CanRemoveCell class] forCellWithReuseIdentifier:NSStringFromClass([CanRemoveCell class])];
    [view registerClass:[CanNotEditCell class] forCellWithReuseIdentifier:NSStringFromClass([CanNotEditCell class])];
    
    
    
    
    NSString *hotString = @"热门标签";
    CGSize hotSize = [hotString sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13]}];
    UILabel *hotTag = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, hotSize.width, hotSize.height)];
    hotTag.text = hotString;
    hotTag.font = [UIFont systemFontOfSize:13];
    hotTag.textColor = [UIColor colorWithHexString:@"403F55"];
    hotTag.center = CGPointMake(maxWidth / 2., 242 - 16 - 13);
    [view addSubview:hotTag];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(16, 241, maxWidth - 32, 1)];
    lineView.backgroundColor = [UIColor colorWithHexString:@"dedede"];
    [view addSubview:lineView];
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
