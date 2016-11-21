//
//  UIImage+Podspec.m
//  Pods
//
//  Created by 王战东 on 16/11/21.
//
//

#import "UIImage+Podspec.h"

@implementation UIImage (Podspec)

+ (UIImage *)zdw_imageNamed:(NSString *)imageName inBundle:(NSString *)bundleName
{
    return [UIImage imageNamed:[NSString stringWithFormat:@"%@.bundle/%@", bundleName, imageName]];
}


@end
