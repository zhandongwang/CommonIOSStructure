//
//  FRWHttpBridge.m
//  FRWHttpEngine
//
//  Created by CaydenK on 16/9/12.
//  Copyright © 2016年 火小二. All rights reserved.
//

#import "FRWHttpBridge.h"
#import "FRWHttpEngine.h"

@implementation FRWHttpBridge

+ (void)postWithRequest:(id<FRWHttpRequesting>)request success:(HttpBridgeSuccess)success failure:(HttpBridgeFailure)failure {
    [[FRWHttpEngine sharedEngine] post:[request requestPatch] params:[request params] success:^(NSURLSessionTask *task, id data) {
        HandleBlock(success,data);
    } failure:^(NSURLSessionTask *task, NSError *error) {
        HandleBlock(failure,error);
    }];

}

+ (void)getWithRequest:(id<FRWHttpRequesting>)request success:(HttpBridgeSuccess)success failure:(HttpBridgeFailure)failure {
    [[FRWHttpEngine sharedEngine] get:[request requestPatch] params:[request params] success:^(NSURLSessionTask *task, id data) {
        HandleBlock(success,data);
    } failure:^(NSURLSessionTask *task, NSError *error) {
        HandleBlock(failure,error);
    }];
}

+ (void)requestingWithGroup:(id<FRWHttpGroupRequesting>)requestGroup completion:(void(^)(id responseDictionary))completion {
    NSMutableDictionary *responseDictionary = @{}.mutableCopy;
    //创建Group,并创建完成回调
    dispatch_group_t group = dispatch_group_create();

    //获取请求数组
    NSArray<id<FRWHttpRequesting>> *requestArray = [requestGroup requestArray];

    //每个请求都发起请求
    for (id<FRWHttpRequesting> request in requestArray) {
        //每个请求都进入group
        dispatch_group_enter(group);
        [request asyncRequestSuccess:^(id data) {
            //返回数据加入字典
            if (data) {
                [responseDictionary setObject:data forKey:[request requestPatch]];
            }
            
            dispatch_group_leave(group);
        } failure:^(NSError *error) {
            //返回错误也加入字典
            [responseDictionary setObject:error forKey:[request requestPatch]];
            
            dispatch_group_leave(group);
        }];
    }
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        HandleBlock(completion,responseDictionary);
    });

}

@end
