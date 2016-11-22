//
//  NSBundle+AdBundle.m
//  Pods
//
//  Created by 王战东 on 16/11/21.
//
//

#import "NSBundle+AdBundle.h"
#import "NSBundle+Podspec.h"

@implementation NSBundle (AdBundle)

+ (NSBundle *)adBundle
{
    return [NSBundle zdw_bundleNamed:@"CommonIOSAd"];
}

@end
