//
//  UIColor+Hex.m
//  CommonStructure
//
//  Created by 王战东 on 16/11/18.
//  Copyright © 2016年 zhandongwang. All rights reserved.
//

#import "UIColor+RGB.h"

@implementation UIColor (RGB)

+ (UIColor *)colorWithRGB:(NSInteger)rgbValue {
    return [self colorWithRGB:rgbValue Alpha:1.0];
}

+ (UIColor *)colorWithRGB:(NSInteger)rgbValue Alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:((float) ((rgbValue & 0xFF0000) >> 16)) / 0xFF
                           green:((float) ((rgbValue & 0xFF00)   >> 8))  / 0xFF
                            blue:((float)  (rgbValue & 0xFF))            / 0xFF
                           alpha:alpha];
}
@end
