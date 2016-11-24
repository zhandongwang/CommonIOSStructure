//
//  FRWHttpRequesting.h
//  FRWHttpEngine
//
//  Created by CaydenK on 16/9/13.
//  Copyright © 2016年 火小二. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  请求成功Block
 *
 *  @param data 请求成功后获取到的数据
 */
typedef void(^HttpBridgeSuccess)(id data);
/**
 *  请求失败Block
 *
 *  @param error 请求失败后的错误信息
 */
typedef void(^HttpBridgeFailure)(NSError *error);

/**
 *  请求协议
 */
@protocol FRWHttpRequesting <NSObject>

@required
/**
 *  请求路径
 *
 *  @return 路径
 */
- (NSString *)requestPatch;
/**
 *  请求所需参数
 *
 *  @return 请求参数
 */
- (NSDictionary *)params;
/**
 *  异步请求
 *
 *  @param success 成功回调
 *  @param failure 失败回调
 */
- (void)asyncRequestSuccess:(HttpBridgeSuccess)success failure:(HttpBridgeFailure)failure;

@end
