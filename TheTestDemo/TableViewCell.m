//
//  TableViewCell.m
//  TheTestDemo
//
//  Created by 沈红榜 on 15/4/23.
//  Copyright (c) 2015年 沈红榜. All rights reserved.
//

#import "TableViewCell.h"

@interface TableViewCell ()<UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation TableViewCell {
    UICollectionView *_collectionView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        CGFloat maxWidth = [UIScreen mainScreen].bounds.size.width;
        
        self.backgroundColor = [UIColor whiteColor];
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(maxWidth, 100);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds)) collectionViewLayout:flowLayout];
        _collectionView.pagingEnabled = YES;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier: NSStringFromClass([UICollectionViewCell class])];
        [self addSubview:_collectionView];
        
        
        
        
        
    }
    return self;
}

- (CGSize)getSize {
    
    _collectionView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100);
    
    
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, 100);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *item = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class]) forIndexPath: indexPath];
    item.backgroundColor = [UIColor colorWithRed:arc4random() % 256 / 255. green:0.4 blue:0.3 alpha:1];
    return item ;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
