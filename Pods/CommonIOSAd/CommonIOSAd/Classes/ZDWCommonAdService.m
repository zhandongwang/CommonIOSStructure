//
//  ZDWCommonAdService.m
//  Pods
//
//  Created by 王战东 on 16/11/21.
//
//

#import "ZDWCommonAdService.h"

@implementation ZDWCommonAdService

+ (instancetype)sharedInstance {
    static ZDWCommonAdService *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

- (void)testMethod {
    NSLog(@"this is a test method in commonService!");
}

@end
