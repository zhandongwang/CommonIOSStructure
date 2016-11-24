//
//  ZDWRootPageBaseRequest.m
//  Pods
//
//  Created by 凤梨 on 16/11/23.
//
//

#import "ZDWRootPageBaseRequest.h"

@interface ZDWRootPageBaseRequest ()

@end

@implementation ZDWRootPageBaseRequest

- (instancetype)init {
    if (self = [super init]) {
        _requestType = @"Get";
    }
    return self;
}

@end
