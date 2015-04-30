//
//  CollectionView.m
//  TheTestDemo
//
//  Created by 沈红榜 on 15/4/28.
//  Copyright (c) 2015年 沈红榜. All rights reserved.
//

#import "CollectionView.h"

@implementation CollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    CGFloat maxWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat itemW = (maxWidth - 32 - 6 * 3) / 4.;
    CGFloat itemH = 37;
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(itemW, itemH);
    flowLayout.sectionInset = UIEdgeInsetsMake(44, 16, 0, 16);
    flowLayout.minimumLineSpacing = 8;
    flowLayout.minimumInteritemSpacing = 2;
    self = [super initWithFrame:frame collectionViewLayout:flowLayout];
    if (self) {
        
    }
    return self;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
