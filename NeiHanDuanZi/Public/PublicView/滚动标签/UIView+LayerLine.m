//
//  UIView+LayerLine.m
//  DXS
//
//  Created by ceing on 16/7/28.
//  Copyright © 2016年 tcm. All rights reserved.
//

#import "UIView+LayerLine.h"

@implementation UIView (LayerLine)


static void  *strLayerLineType = &strLayerLineType;

static void *strLayerHeight = &strLayerHeight;


#pragma mark - layerLineType -

-(LayerLineType)layerLineType{
    
    NSNumber *number = objc_getAssociatedObject(self, &strLayerLineType);
    
    
    return [number integerValue];
    
    
}


- (void)setLayerLineType:(LayerLineType)layerLineType{
    
    CGFloat borderWidth = self.layer.borderWidth == 0 ? 0.3:self.layer.borderWidth;
    
    if(self.layer.borderWidth == 0)
    self.layer.borderColor = [UIColor colorWithRed:129.0/255 green:129.0/255 blue:129.0/255 alpha:0.3].CGColor;
    

    
    CGSize mainSize = self.frame.size;
    
    CGFloat layerHeight = self.layerHeight;
    
    CGFloat height = layerHeight != 0 ? layerHeight :mainSize.height;
    
    
    if (layerLineType & LayerLineTypeBottom) {
        
        [self createAddBorderLayerWithFrame:CGRectMake(0, mainSize.height-borderWidth, mainSize.width, borderWidth)];
        
    }
    if (layerLineType & LayerLineTypeLeft) {
        
        [self createAddBorderLayerWithFrame:CGRectMake(0, (mainSize.height-height)/2.0, borderWidth, height)];
        
    }
    if (layerLineType & LayerLineTypeRight) {
        
        [self createAddBorderLayerWithFrame:CGRectMake(mainSize.width-borderWidth, (mainSize.height-height)/2.0, borderWidth, height)];
        
    }
    if (layerLineType & LayerLineTypeTop) {
        
        [self createAddBorderLayerWithFrame:CGRectMake(0, 0, mainSize.width, borderWidth)];
        
    }
    
    self.layer.borderWidth = 0;
    
    NSNumber *number = [NSNumber numberWithInteger:layerLineType];
    objc_setAssociatedObject(self, &strLayerLineType, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}




#pragma mark - LayerHeight -


-(void)setLayerHeight:(CGFloat)layerHeight{
    
    NSNumber *height = [NSNumber numberWithFloat:layerHeight];
    
    objc_setAssociatedObject(self, & strLayerHeight, height, OBJC_ASSOCIATION_RETAIN);
}

-(CGFloat)layerHeight{
   
    return [objc_getAssociatedObject(self, &strLayerHeight) floatValue];
    
}

#pragma mark -

-(void)createAddBorderLayerWithFrame:(CGRect)frame{
    
    CALayer *borderLayer = [CALayer layer];
    borderLayer.frame = frame;
    borderLayer.backgroundColor = self.layer.borderColor;
    [self.layer addSublayer:borderLayer];
    
}




@end
