//
//  SearchViewController.m
//  TheTestDemo
//
//  Created by 沈红榜 on 15/4/29.
//  Copyright (c) 2015年 沈红榜. All rights reserved.
//

#import "SearchViewController.h"
#import "CollViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRedo target:self action:@selector(tempAction)];
    
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
    

//    SHBSearchBar *shbBar = [[SHBSearchBar alloc] initWithFrame:CGRectMake(0, 0, 323, 30)];
//    shbBar.borderStyle = UITextBorderStyleRoundedRect;
//    shbBar.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"你喜欢的话题 (不要超过4个字)" attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13], NSForegroundColorAttributeName : [UIColor redColor]}];
//    UIImageView *leftView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 10, 15)];
//    leftView.image = [UIImage imageNamed:@"Rectangle 462"];
//    shbBar.leftView = leftView;
//    shbBar.leftViewMode = UITextFieldViewModeUnlessEditing;
//    
//    self.navigationItem.titleView = shbBar;
    
    CollViewController *collVC = [[CollViewController alloc] init];
    
    UISearchController *searchController = [[UISearchController alloc] initWithSearchResultsController:collVC];
    
    self.navigationItem.titleView = searchController.searchBar;
    
    self.view.backgroundColor = [UIColor grayColor];
    
}

- (void)tempAction {
    
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


@implementation SHBSearchBar {
    CGRect _rect;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _rect = frame;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
}


- (void)drawPlaceholderInRect:(CGRect)rect {
    CGSize size = [@"请" sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13]}];
    
    rect = _rect;
    CGRect kkRect = [self.attributedPlaceholder boundingRectWithSize:CGSizeMake(0, size.height) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin context:nil];
    [self.attributedPlaceholder drawInRect:CGRectMake(rect.origin.x, CGRectGetMaxY(rect) - CGRectGetHeight(rect) / 2. - size.height / 2., kkRect.size.width, kkRect.size.height)];
}

@end




