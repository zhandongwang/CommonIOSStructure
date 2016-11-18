//
//  UIColor+Hex.h
//  CommonStructure
//
//  Created by 王战东 on 16/11/18.
//  Copyright © 2016年 zhandongwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (RGB)

/**
 *  根据0xFFFFFF格式RGB值，不透明度创建UIColor
 *
 *  @param rgbValue 0xFFFFFF格式RGB值
 *  @param alpha    不透明度值
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithRGB:(NSInteger)rgbValue Alpha:(CGFloat)alpha;
+ (UIColor *)colorWithRGB:(NSInteger)rgbValue;

@end
