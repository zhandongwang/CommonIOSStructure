//
//  FRWHttpEngine.h
//  FRWHttpEngine
//
//  Created by CaydenK on 16/9/8.
//  Copyright © 2016年 火小二. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FRWHttpMacroDefine.h"

@interface FRWHttpEngine : NSObject

/**
 *  超时时间
 */
@property (assign, nonatomic) NSTimeInterval timeoutInterval;
/**
 *  根地址
 */
@property (copy, nonatomic) NSString *baseUrl;
/**
 *  文件上传根地址
 */
@property (copy, nonatomic) NSString *uploadBaseUrl;

/**
 *  HTTP引擎单例
 *
 *  @return HTTP引擎
 */
+ (instancetype)sharedEngine;


/**
 *  设置好信息后，设定HTTP引擎初始化信息
 */
- (void)configureHttpEngineInitInfomations;

/**
 *  判断是否有网络
 *
 *  @return 是否有网络
 */
- (BOOL)hasNetwork;

/**
 *  取消请求
 *
 *  @param requestPath 请求路径
 */
- (void)cancelRequetWithPatch:(NSString *)requestPath;

/**
 *  POST请求
 *
 *  @param path    路径
 *  @param params  参数
 *  @param success 成功回调block
 *  @param failure 失败回调block
 */
- (void)post:(NSString *)path params:(NSDictionary *)params success:(FRWHttpSuccess)success failure:(FRWHttpFailure)failure;

/**
 *  POST请求（上传文件）
 *
 *  @param path     请求路径
 *  @param fileName 文件名
 *  @param fileData 文件二进制数据
 *  @param params   请求参数
 *  @param success  成功回调block
 *  @param failure  失败回调block
 */
- (void)post:(NSString *)path fileName:(NSString *)fileName fileData:(NSData *)fileData params:(NSDictionary *)params success:(FRWHttpSuccess)success failure:(FRWHttpFailure)failure;

/**
 *  GET请求
 *
 *  @param path    路径
 *  @param params  参数
 *  @param success 成功回调block
 *  @param failure 失败回调block
 */
- (void)get:(NSString *)path params:(NSDictionary *)params success:(FRWHttpSuccess)success failure:(FRWHttpFailure)failure;


@end
