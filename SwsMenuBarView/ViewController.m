//
//  ViewController.m
//
//  Created by sws on 6/6/6.
//  Copyright © 666年 sws. All rights reserved.
//

#import "ViewController.h"
#import "SwsMenuBarView.h"
#import "SwsMenuBarItemModel.h"

@interface ViewController () <SwsMenuBarViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSMutableArray *array1 = [NSMutableArray array];
    for (int i = 0; i < 5; i ++) {
        
        SwsMenuBarItemModel *model = [[SwsMenuBarItemModel alloc] init];
        model.title = [NSString stringWithFormat:@"Item%d", i];
        [array1 addObject:model];
    }
    SwsMenuBarView *view1 = [[SwsMenuBarView alloc] initWithFrame:CGRectMake(0, 40, self.view.bounds.size.width, 45) modelArray:array1 type:Only_Title_Bar delegate:self];
    [self.view addSubview:view1];
    
    
    NSMutableArray *array2 = [NSMutableArray array];
    for (int i = 0; i < 5; i ++) {
        
        SwsMenuBarItemModel *model = [[SwsMenuBarItemModel alloc] init];
        model.title = [NSString stringWithFormat:@"Item%d", i];
        model.subTitle = [NSString stringWithFormat:@"%d", i];
        [array2 addObject:model];
    }
    SwsMenuBarView *view2 = [[SwsMenuBarView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 45) modelArray:array2 type:Two_Titles_Bar delegate:self];
    [self.view addSubview:view2];
    
    
    NSMutableArray *array3 = [NSMutableArray array];
    for (int i = 0; i < 5; i ++) {
        
        SwsMenuBarItemModel *model = [[SwsMenuBarItemModel alloc] init];
        model.title = [NSString stringWithFormat:@"Item%d", i];
        model.imageName = [NSString stringWithFormat:@"%d.png", i];
        [array3 addObject:model];
    }
    SwsMenuBarView *view3 = [[SwsMenuBarView alloc] initWithFrame:CGRectMake(0, 160, self.view.bounds.size.width, 45) modelArray:array3 type:Image_Title_Bar delegate:self];
    [self.view addSubview:view3];
    
    NSMutableArray *array4 = [NSMutableArray array];
    for (int i = 0; i < 5; i ++) {
        
        SwsMenuBarItemModel *model = [[SwsMenuBarItemModel alloc] init];
        model.title = [NSString stringWithFormat:@"Item%d", i];
        model.imageName = [NSString stringWithFormat:@"%d.png", i];
        [array4 addObject:model];
    }
    SwsMenuBarView *view4 = [[SwsMenuBarView alloc] initWithFrame:CGRectMake(0, 230, self.view.bounds.size.width, 45) modelArray:array4 type:Title_Image_Bar delegate:self];
    [self.view addSubview:view4];
}

#pragma mark - SwsMenuBarViewDelegate
- (void)returnSwsMenuBarViewIndex:(NSInteger)index {
    
    NSLog(@"%ld", index);
}

@end
