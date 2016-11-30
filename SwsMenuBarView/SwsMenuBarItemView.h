//
//  SwsMenuBarItemView.h
//
//  Created by sws on 6/6/6.
//  Copyright © 666年 sws. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SwsMenuBarItemModel.h"

typedef enum {
    
    Only_Title,
    Two_Titles,
    Image_Title,
    Title_Image,
} SwsMenuBarItemType;


@interface SwsMenuBarItemView : UIView

@property (weak, nonatomic) IBOutlet UIButton *button;

- (SwsMenuBarItemView *)initWithFrame:(CGRect)frame
                                model:(SwsMenuBarItemModel *)model
                                 type:(SwsMenuBarItemType)type;

@end
