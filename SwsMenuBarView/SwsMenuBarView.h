//
//  SwsMenuBarView.h
//
//  Created by sws on 6/6/6.
//  Copyright © 666年 sws. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SwsMenuBarItemModel.h"
#import "SwsMenuBarItemView.h"

typedef enum {
    
    Only_Title_Bar,
    Two_Titles_Bar,
    Image_Title_Bar,
    Title_Image_Bar,
    
} SwsMenuBarType;


@protocol SwsMenuBarViewDelegate <NSObject>

@optional

// 0,1,2.... Left >> Right
- (void)returnSwsMenuBarViewIndex:(NSInteger)index;

@end

@interface SwsMenuBarView : UIView

@property (nonatomic, weak) id <SwsMenuBarViewDelegate> delegate;

- (SwsMenuBarView *)initWithFrame:(CGRect)frame
                       modelArray:(NSMutableArray *)modelArray
                             type:(SwsMenuBarType)type
                         delegate:(id)delegate;

@end
