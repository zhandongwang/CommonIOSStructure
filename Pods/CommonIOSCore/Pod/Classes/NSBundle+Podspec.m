//
//  NSBundle+Podspec.m
//  Pods
//
//  Created by 王战东 on 16/11/21.
//
//

#import "NSBundle+Podspec.h"

@implementation NSBundle (Podspec)

+ (NSBundle *)zdw_bundleNamed:(NSString *)bundleName
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSURL *url = [bundle URLForResource:bundleName withExtension:@"bundle"];
    
    if (url) {
        return [NSBundle bundleWithURL:url];
    } else {
        assert("bundle cannot find, please check");
        return nil;
    }
}

@end
