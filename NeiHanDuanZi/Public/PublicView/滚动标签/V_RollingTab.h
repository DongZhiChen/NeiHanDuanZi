//
//  V_ RollingTab.h
//  TCM
//
//  Created by ceing on 16/6/17.
//  Copyright © 2016年 tcm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+LayerLine.h"


@protocol V_RollingTabDelegate <NSObject>

///点击按钮回调
-(void)V_RollingTabSelectedIndx:(NSInteger)index;

@end


@interface V_RollingTab : UIView <UIScrollViewDelegate>

@property (nonatomic,assign) id <V_RollingTabDelegate> delegate;

@property (nonatomic,retain) NSArray *arrayTitles;

@property (nonatomic,assign) BOOL isAddIndexLine;

@property (nonatomic,assign) BOOL isCanRoll;

@property (nonatomic,assign) int selectedIndex;

@property (nonatomic,retain) UIColor *selectedColor;

@property (nonatomic,retain) UIColor *normalColor;

@property (nonatomic,retain) UIFont *titleFont;

@property (nonatomic,retain) UIColor *lineColor;

@property (nonatomic,assign) CGSize tabTitleSize;

@end

