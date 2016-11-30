//
//  SwsMenuBarItemView.m
//
//  Created by sws on 6/6/6.
//  Copyright © 666年 sws. All rights reserved.
//

#import "SwsMenuBarItemView.h"

#define ImageOfPath(a) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:a ofType:nil]]


@interface SwsMenuBarItemView ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLabelCenterY;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageViewBottomToTitleLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *subTitleTopToTitle;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageWidth;

@end

@implementation SwsMenuBarItemView

- (void)awakeFromNib {
    
    self.autoresizingMask = UIViewAutoresizingNone;
}

- (SwsMenuBarItemView *)initWithFrame:(CGRect)frame
                                model:(SwsMenuBarItemModel *)model
                                 type:(SwsMenuBarItemType)type {
    
    SwsMenuBarItemView *itemView = [[[NSBundle mainBundle] loadNibNamed:@"SwsMenuBarItemView" owner:self options:nil]firstObject];
    itemView.frame = frame;
    if (type == Only_Title) {
        
        [itemView.imageView removeFromSuperview];
        [itemView.subTitleLabel removeFromSuperview];
        
        itemView.titleLabel.text = model.title;
    }
    
    if (type == Two_Titles) {
        
        [itemView.imageView removeFromSuperview];
        itemView.titleLabelCenterY.constant = -frame.size.height / 5;
        itemView.subTitleTopToTitle.constant = frame.size.height * frame.size.height / 22 / 22;
        
        itemView.titleLabel.text = model.title;
        itemView.subTitleLabel.text = model.subTitle;
    }
    
    if (type == Image_Title) {
        
        [itemView.subTitleLabel removeFromSuperview];
        itemView.titleLabelCenterY.constant = frame.size.height / 5;
        itemView.imageWidth.constant = frame.size.height / 2.5;
        
        itemView.imageView.image = ImageOfPath(model.imageName);
        itemView.titleLabel.text = model.title;
    }
    
    if (type == Title_Image) {
        
        [itemView.subTitleLabel removeFromSuperview];
        itemView.titleLabelCenterY.constant = -frame.size.height / 5;
        itemView.imageWidth.constant = frame.size.height / 2.5;
        
        itemView.imageViewBottomToTitleLabel.constant = -itemView.imageWidth.constant - itemView.titleLabel.bounds.size.height;
        itemView.imageView.image = ImageOfPath(model.imageName);
        itemView.titleLabel.text = model.title;
        
    }
    
    return itemView;
}

@end
