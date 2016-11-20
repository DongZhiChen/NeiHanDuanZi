//
//  V_ RollingTab.m
//  TCM
//
//  Created by ceing on 16/6/17.
//  Copyright © 2016年 tcm. All rights reserved.
//

#import "V_RollingTab.h"

@implementation V_RollingTab{

    UIScrollView *SV_Tab;
    UIView *line;
    UIButton *BTN_Selected;
    
}


-(id)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]){
    
        self.layer.opaque = NO;
        
        [self initSet];
    
    }
    
    
    return self;
    
}

-(void)initSet{

    self.clipsToBounds = YES;
    _titleFont = [UIFont systemFontOfSize:13];
    _normalColor = [UIColor whiteColor];
    _selectedColor = [UIColor redColor];
    _lineColor = [UIColor orangeColor];
    _isCanRoll = NO;
    _isAddIndexLine = NO;
    _selectedIndex = 0;
    _tabTitleSize = CGSizeMake(60.0, CGRectGetHeight(self.frame));
    
    self.layer.borderColor = [UIColor colorWithRed:43.0/255 green:43.0/255 blue:43.0/255 alpha:0.3].CGColor;
    self.layer.borderWidth = 0.8;
    self.layerLineType = LayerLineTypeTop | LayerLineTypeBottom;
    
}



-(void)createTabItem{

    if(!_isCanRoll){
    
        _tabTitleSize = CGSizeMake(CGRectGetWidth(self.bounds)/_arrayTitles.count, CGRectGetHeight(self.bounds));
    }
    
    for (int i = 0; i < _arrayTitles.count; i++){
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = 100+i;
        btn.frame = CGRectMake(_tabTitleSize.width*i, 0, _tabTitleSize.width, CGRectGetHeight(self.bounds));
        btn.titleLabel.font = _titleFont;
        [btn setTitleColor:_normalColor forState:UIControlStateNormal];
        [btn setTitleColor:_selectedColor forState:UIControlStateSelected];
        [btn setTitle:_arrayTitles[i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(selectedTab:) forControlEvents:UIControlEventTouchUpInside];
        
        if(i == _selectedIndex){
            
            btn.selected = YES;
            BTN_Selected = btn;
        }
        
        if(i > 0){
            
            btn.layer.borderColor = [UIColor grayColor].CGColor;
            btn.layer.borderWidth = 0.5;
            btn.layerHeight = CGRectGetHeight(self.bounds)/3;
            btn.layerLineType = LayerLineTypeLeft;
        }
        
        if(_isCanRoll){
        
            [SV_Tab addSubview:btn];
            
        }else{
        
            [self addSubview:btn];
        }
        
    }

    
    if (_isAddIndexLine){
        
        CGRect lineFrame ;
        lineFrame.origin.x = _selectedIndex * _tabTitleSize.width;
        lineFrame.origin.y = CGRectGetHeight(self.bounds)-2;
        lineFrame.size.width = _tabTitleSize.width;
        lineFrame.size.height = 1;
        
        line = [[UIView alloc] initWithFrame:lineFrame];
        line.backgroundColor = _lineColor;
        
        if(_isCanRoll){
            
            [SV_Tab addSubview:line];
            
        }else{
            
            [self addSubview:line];
        }
        
    }
    
}




#pragma mark - setter,getter -

-(void)setIsCanRoll:(BOOL)isCanRoll{

    _isCanRoll = isCanRoll;
    
    if(isCanRoll){
    
        SV_Tab = [[UIScrollView alloc] initWithFrame:self.bounds];
        SV_Tab.contentSize = CGSizeMake(_arrayTitles.count*_tabTitleSize.width, CGRectGetHeight(self.bounds));
        SV_Tab.showsHorizontalScrollIndicator = NO;
        [self addSubview:SV_Tab];
        
    }

}



#pragma mark - UIButtonEventClick -

-(void)selectedTab:(UIButton *)sender{

    NSInteger index = sender.tag - 100;
    
    if(!sender.isSelected){
    
        sender.selected = YES;
        
        BTN_Selected.selected = NO;
        
        BTN_Selected = sender;
        
        if(_isAddIndexLine){
            
            CGRect frame = line.frame;
            frame.origin.x = _tabTitleSize.width*index;
            
            [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseIn animations:^{
                
                line.frame =  frame;
                
            } completion:^(BOOL finished) {}];
            
            
            [self.delegate V_RollingTabSelectedIndx:index];
            
        }
    }
}


#pragma mark - draw -

-(void)drawRect:(CGRect)rect{
    
    [super drawRect:rect];
    
    [self createTabItem];
    
}

@end
