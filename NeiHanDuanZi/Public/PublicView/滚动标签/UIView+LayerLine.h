//
//  UIView+LayerLine.h
//  DXS
//
//  Created by ceing on 16/7/28.
//  Copyright © 2016年 tcm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

typedef NS_ENUM(NSInteger, LayerLineType) {
    
    LayerLineTypeTop = 1<<1,
    LayerLineTypeLeft = 1<<2,
    LayerLineTypeBottom = 1<<3,
    LayerLineTypeRight = 1<<4,
    
};



@interface UIView (LayerLine)

///边框位置
@property (nonatomic,assign) LayerLineType layerLineType;


@property (nonatomic, assign) CGFloat layerHeight;
@end
