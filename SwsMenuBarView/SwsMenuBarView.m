//
//  SwsMenuBarView.m
//
//  Created by sws on 6/6/6.
//  Copyright © 666年 sws. All rights reserved.
//

#define Width   self.bounds.size.width
#define Height  self.bounds.size.height

#define SliderViewHeight  2  // 滑块高度

#define IsEqual NO  // 滑块是否等分
#define Font   15    // 字体大小

#import "SwsMenuBarView.h"

@interface SwsMenuBarView ()

@property (nonatomic, strong) NSMutableArray *modelArray;
@property (nonatomic, assign) NSInteger index;

@property (nonatomic, strong) NSMutableArray *widthArray;

@property (nonatomic, strong) UIView *sliderView;

@property (nonatomic, strong) UIButton *selectedButton;

@property (nonatomic, assign) SwsMenuBarType type;


@end

@implementation SwsMenuBarView

- (SwsMenuBarView *)initWithFrame:(CGRect)frame
                       modelArray:(NSMutableArray *)modelArray
                             type:(SwsMenuBarType)type
                         delegate:(id)delegate {

    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        _modelArray = modelArray;
        _type = type;
        _delegate = delegate;
        [self initUI];
    }
    return self;
}

#pragma mark - InitUI
- (void)initUI {
    
    SwsMenuBarItemType itemType;
    
    switch (_type) {
            
        case Only_Title_Bar:
            itemType = Only_Title;
            break;
        case Two_Titles_Bar:
            itemType = Two_Titles;
            break;
        case Image_Title_Bar:
            itemType = Image_Title;
            break;
        case Title_Image_Bar:
            itemType = Title_Image;
            break;
            
        default:
            break;
    }
    
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Width, Height)];
    topView.backgroundColor = [UIColor redColor];
    [self addSubview:topView];
    
    if (!IsEqual) {
        
        _widthArray = [NSMutableArray array];
        for (SwsMenuBarItemModel *model in _modelArray) {
            
            CGFloat width = [self widthWithString:model.title andFontSize:Font];
            [_widthArray addObject:[NSString stringWithFormat:@"%lf",width]];
        }
    }
    
    for (int i = 0; i < _modelArray.count; i ++) {
        
        SwsMenuBarItemView *itemView = [[SwsMenuBarItemView alloc] initWithFrame:CGRectMake(i * Width / _modelArray.count, 0, Width / _modelArray.count, Height) model:_modelArray[i] type:itemType];
        
        itemView.backgroundColor = [UIColor greenColor];
        itemView.button.tag = i;
        [itemView.button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
        if (i == _index) {
            
            itemView.button.selected = YES;
            _selectedButton = itemView.button;
        }
        [topView addSubview:itemView];
    }

    _sliderView = [[UIView alloc] init];
    _sliderView.backgroundColor = [UIColor orangeColor];
    if (IsEqual) {
        
        _sliderView.bounds = CGRectMake(0, 0, Width / _modelArray.count, SliderViewHeight);
    } else {
        
        _sliderView.bounds = CGRectMake(0, 0, [_widthArray[_index] floatValue], SliderViewHeight);
    }
    _sliderView.center = CGPointMake((2 * ((CGFloat)_index + 1) - 1) / 2 / _modelArray.count * Width, Height - SliderViewHeight / 2);
    [self addSubview:_sliderView];
}

#pragma mark - 点击事件
- (void)buttonPressed:(UIButton *)sender {
    
    _selectedButton.selected = !_selectedButton.selected;
    sender.selected = !sender.selected;
    _selectedButton = sender;
    
    [UIView animateWithDuration:0.3 animations:^{
        
        if (!IsEqual) {
            
            _sliderView.bounds = CGRectMake(0, 0, [_widthArray[sender.tag] floatValue], SliderViewHeight);
        }
        _sliderView.center = CGPointMake((2 * ((CGFloat)sender.tag + 1) - 1) / 2 / _modelArray.count * Width, Height - SliderViewHeight / 2);
    }];
    
    if (_delegate && [_delegate respondsToSelector:@selector(returnSwsMenuBarViewIndex:)]) {
        
        [_delegate returnSwsMenuBarViewIndex:sender.tag];
    }
}

#pragma mark - 宽度
- (float)widthWithString:(NSString*)string andFontSize:(int)fontSize {
    
    CGSize size = CGSizeMake(MAXFLOAT, 0); //设置一个行高上限
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]};
    CGSize detailSize = [string boundingRectWithSize:size
                                             options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                          attributes:attribute
                                             context:nil].size;
    return detailSize.width;
}

@end
