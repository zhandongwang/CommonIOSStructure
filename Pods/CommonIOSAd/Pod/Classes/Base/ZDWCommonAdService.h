//
//  ZDWCommonAdService.h
//  Pods
//
//  Created by 王战东 on 16/11/21.
//
//

#import <Foundation/Foundation.h>

@interface ZDWCommonAdService : NSObject

+ (instancetype)sharedInstance;
- (UIView *)commonAdView;

@end
