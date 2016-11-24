//
//  ZDWHomePageRequest.m
//  Pods
//
//  Created by 凤梨 on 16/11/23.
//
//

#import "ZDWHomePageRequest.h"

@implementation ZDWHomePageRequest

- (instancetype)init {
    if (self = [super init]) {
        self.requestType = @"Get";
    }
    return self;
}

- (void)setPath:(NSString *)path {
    self.requestPath = path;
}

- (void)setParams:(NSDictionary *)params {
    self.requestParams = params;
}

@end
