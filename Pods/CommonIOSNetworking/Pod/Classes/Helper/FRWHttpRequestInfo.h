//
//  FRWHttpRequestInfo.h
//  FRWHttpEngine
//
//  Created by CaydenK on 16/9/8.
//  Copyright © 2016年 火小二. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FRWHttpRequestInfo : NSObject

+ (NSString *)contentType;
+ (NSString *)system;
+ (NSString *)sysVersion;
+ (NSString *)appVersion;
+ (NSString *)network;
+ (NSString *)screenSize;
+ (NSString *)deviceBrand;
+ (NSString *)equipmentId;
+ (NSString *)location;

/**
 *  获取签名后的请求参数字典
 *
 *  @param params 原请求参数字典
 *  @param mobile 手机号
 *
 *  @return 签名后的请求参数
 */
+ (NSMutableDictionary *)createSignDictionaryWithParams:(NSDictionary *)params mobile:(NSString *)mobile;

@end
