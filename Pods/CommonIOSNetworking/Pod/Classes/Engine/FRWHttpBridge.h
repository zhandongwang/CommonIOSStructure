//
//  FRWHttpBridge.h
//  FRWHttpEngine
//
//  Created by CaydenK on 16/9/12.
//  Copyright © 2016年 火小二. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FRWHttpRequesting.h"
#import "FRWHttpGroupRequesting.h"

#define HandleBlock(block, ...)         if(block) { block(__VA_ARGS__); }

@interface FRWHttpBridge : NSObject

+ (void)postWithRequest:(id<FRWHttpRequesting>)request success:(HttpBridgeSuccess)success failure:(HttpBridgeFailure)failure;
+ (void)getWithRequest:(id<FRWHttpRequesting>)request success:(HttpBridgeSuccess)success failure:(HttpBridgeFailure)failure;

+ (void)requestingWithGroup:(id<FRWHttpGroupRequesting>)group completion:(void(^)(id responseDictionary))completion;

@end
