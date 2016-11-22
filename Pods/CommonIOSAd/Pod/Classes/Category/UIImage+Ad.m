//
//  UIImage+Ad.m
//  Pods
//
//  Created by 王战东 on 16/11/21.
//
//

#import "UIImage+Ad.h"
#import "UIImage+Podspec.h"

@implementation UIImage (Ad)

+ (UIImage *)adImageNamed:(NSString *)imageName {
    
    return [self zdw_imageNamed:imageName inBundle:@"CommonIOSAd"];
}
@end
