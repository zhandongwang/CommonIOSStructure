//
//  FRWHttpRequestInfo.m
//  FRWHttpEngine
//
//  Created by CaydenK on 16/9/8.
//  Copyright © 2016年 火小二. All rights reserved.
//

#import "FRWHttpRequestInfo.h"
#import <UIKit/UIKit.h>
#import "CocoaSecurity.h"
#import "AFNetworking.h"
#import "FRWHttpEncryptHelper.h"

static NSString *const kApiServerKey = @"100011";

@implementation FRWHttpRequestInfo

+ (NSString *)contentType {
    return @"application/x-www-form-urlencoded; charset=utf-8";
}

+ (NSString *)system {
    return @"ios";
}
+ (NSString *)sysVersion {
    return [[UIDevice currentDevice] systemVersion];
}
+ (NSString *)appVersion {
    return [[[NSBundle mainBundle] infoDictionary]
            objectForKey:@"CFBundleShortVersionString"];
}
+ (NSString *)network {
    AFNetworkReachabilityStatus status = [AFNetworkReachabilityManager sharedManager].networkReachabilityStatus;
    if (status == AFNetworkReachabilityStatusReachableViaWWAN) {
        return @"2";
    }else if (status == AFNetworkReachabilityStatusReachableViaWiFi){
        return @"3";
    }else{
        return @"6";
    }
}
+ (NSString *)screenSize {
    return [NSString stringWithFormat:@"%.f X %.f",[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height];
}
+ (NSString *)deviceBrand {
    return [[UIDevice currentDevice] name];
}
+ (NSString *)equipmentId {
    return [[CocoaSecurity md5:[UIDevice currentDevice].identifierForVendor.UUIDString] hexLower];
}
+ (NSString *)location {
    id appDelegate = [UIApplication sharedApplication].delegate;
    NSDictionary *GPS = [appDelegate valueForKey:@"GPS"];
    NSString *latitude = [GPS objectForKey:@"latitude"] ? : @"";
    NSString *longtitude = [GPS objectForKey:@"longtitude"] ? : @"";
    if (latitude && longtitude) {
        NSString *s_local = dataTojsonString(@{@"longitude": longtitude, @"latitude": latitude});
        return s_local ?: @"";
    }
    return @"";
}

+ (NSMutableDictionary *)createSignDictionaryWithParams:(NSDictionary *)params mobile:(NSString *)mobile {
    NSMutableDictionary *temParams = @{
                                       @"appKey":kApiServerKey,
                                       @"format":@"json",
                                       @"uid":(mobile ?: @""),
                                       @"timestamp":[self timeString],
                                       }.mutableCopy;
    
    if (params!=nil) {
        [temParams addEntriesFromDictionary:params];
        NSString *sign = [FRWHttpEncryptHelper convertSign:temParams];
        [temParams setObject:sign forKey:@"sign"];
    }
    return temParams;
}

+ (NSString *)timeString {
    NSString *mseStr = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"timeMse"]];
    long long mse = [mseStr longLongValue];
    long long time = [[NSDate date] timeIntervalSince1970] * 1000 + mse;
    NSString *timeString = [NSString stringWithFormat:@"%lld", time];
    return timeString;
}

NSString *dataTojsonString(NSDictionary *dict) {
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
    
}

@end
