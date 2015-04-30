//
//  SearchViewController.m
//  TheTestDemo
//
//  Created by 沈红榜 on 15/4/29.
//  Copyright (c) 2015年 沈红榜. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRedo target:self action:@selector(goBack)];
//    self.navigationItem.leftBarButtonItem = leftItem;
//    
//    
//    UITextField *searchBar = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame) - 60, 30)];
//    searchBar.borderStyle = UITextBorderStyleRoundedRect;
//    searchBar.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"你喜欢的话题 (不要超过4个字)" attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:11], NSForegroundColorAttributeName : [UIColor redColor]}];
//    
//
//    UIImageView *leftView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
//    leftView.image = [UIImage imageNamed:@"account-circle-normal"];
//    searchBar.leftView = leftView;
//    searchBar.leftViewMode = UITextFieldViewModeUnlessEditing;
//    self.navigationItem.titleView = searchBar;
    

    SHBSearchBar *shbBar = [[SHBSearchBar alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    shbBar.borderStyle = UITextBorderStyleRoundedRect;
    shbBar.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"你喜欢的话题 (不要超过4个字)" attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:11], NSForegroundColorAttributeName : [UIColor redColor]}];
    UIImageView *leftView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    leftView.image = [UIImage imageNamed:@"account-circle-normal"];
    shbBar.leftView = leftView;
    shbBar.leftViewMode = UITextFieldViewModeUnlessEditing;
    self.navigationItem.titleView = shbBar;
    
    
    
}



- (CGRect)placeholderRectForBounds:(CGRect)bounds {
    return CGRectMake(bounds.origin.x, 20, bounds.size.width, 30);
}

- (void)goBack {
    
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


@implementation SHBSearchBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)drawPlaceholderInRect:(CGRect)rect {
    CGSize size = [@"请" sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:11]}];
    
    CGRect kkRect = [self.attributedPlaceholder boundingRectWithSize:CGSizeMake(0, size.height) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin context:nil];
    [self.attributedPlaceholder drawInRect:CGRectMake(rect.origin.x, CGRectGetMaxY(rect) - CGRectGetHeight(rect) / 2. - size.height / 2., kkRect.size.width, kkRect.size.height)];
}

@end




