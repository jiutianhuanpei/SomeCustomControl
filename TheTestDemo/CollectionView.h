//
//  CollectionView.h
//  TheTestDemo
//
//  Created by 沈红榜 on 15/4/28.
//  Copyright (c) 2015年 沈红榜. All rights reserved.
//


#import <UIKit/UIKit.h>
typedef enum : NSUInteger {
    selectedTag,
    editTag,
    
} WitchTag;



@interface CollectionView : UICollectionView

@property (nonatomic, assign) WitchTag witchTag;

@end
